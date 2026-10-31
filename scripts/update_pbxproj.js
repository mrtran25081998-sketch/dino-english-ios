// scripts/update_pbxproj.js
const fs = require('fs');
const path = require('path');
const crypto = require('crypto');

function genId(seed) {
  return crypto.createHash('md5').update(seed).digest('hex').substring(0, 24).toUpperCase();
}

const baseDir = path.resolve(__dirname, '..', 'iOS', 'DinoEnglish');
const projectFile = path.resolve(__dirname, '..', 'iOS', 'DinoEnglish.xcodeproj', 'project.pbxproj');

// Scan all files in DinoEnglish recursively
function scanDir(dir, relPath = '') {
  let results = [];
  const entries = fs.readdirSync(dir, { withFileTypes: true });
  for (const entry of entries) {
    if (entry.name === 'Assets.xcassets') {
      results.push({
        name: 'Assets.xcassets',
        fullPath: path.join(dir, entry.name),
        relPath: path.join(relPath, entry.name).replace(/\\/g, '/'),
        isAssetCatalog: true
      });
    } else if (entry.isDirectory()) {
      results = results.concat(scanDir(path.join(dir, entry.name), path.join(relPath, entry.name)));
    } else if (entry.name.endsWith('.swift') || entry.name.endsWith('.json') || entry.name.endsWith('.ttf') || entry.name.endsWith('.plist')) {
      results.push({
        name: entry.name,
        fullPath: path.join(dir, entry.name),
        relPath: path.join(relPath, entry.name).replace(/\\/g, '/'),
        isSwift: entry.name.endsWith('.swift'),
        isJson: entry.name.endsWith('.json'),
        isFont: entry.name.endsWith('.ttf'),
        isPlist: entry.name.endsWith('.plist')
      });
    }
  }
  return results;
}

const files = scanDir(baseDir);
console.log(`Found ${files.length} project items to index.`);

// Generate PBX entities
const fileRefs = [];
const buildFiles = [];
const sourcesBuildPhaseFiles = [];
const resourcesBuildPhaseFiles = [];

files.forEach(f => {
  const fileRefId = genId(`fileref_${f.relPath}`);
  const buildFileId = genId(`buildfile_${f.relPath}`);
  
  f.fileRefId = fileRefId;
  f.buildFileId = buildFileId;
  
  let fileType = "sourcecode.swift";
  if (f.isAssetCatalog) fileType = "folder.assetcatalog";
  else if (f.isJson) fileType = "text.json";
  else if (f.isFont) fileType = "file";
  else if (f.isPlist) fileType = "text.plist.xml";
  
  fileRefs.push({
    id: fileRefId,
    name: f.name,
    path: f.relPath,
    lastKnownFileType: fileType
  });
  
  if (f.isSwift) {
    buildFiles.push({ id: buildFileId, fileRef: fileRefId });
    sourcesBuildPhaseFiles.push(buildFileId);
  } else if (f.isAssetCatalog || f.isJson || f.isFont) {
    buildFiles.push({ id: buildFileId, fileRef: fileRefId });
    resourcesBuildPhaseFiles.push(buildFileId);
  }
});

// Build PBXGroup tree
function buildGroups() {
  const groupObjects = {};
  
  // We can group files by their folder structure
  const folderTree = { name: 'DinoEnglish', path: 'DinoEnglish', children: [], groups: {} };
  
  files.forEach(f => {
    const parts = f.relPath.split('/');
    let current = folderTree;
    for (let i = 0; i < parts.length - 1; i++) {
      const part = parts[i];
      if (!current.groups[part]) {
        current.groups[part] = { name: part, path: part, children: [], groups: {} };
      }
      current = current.groups[part];
    }
    current.children.push(f);
  });
  
  function processGroup(node, parentPath = '') {
    const groupId = genId(`group_${parentPath}/${node.path}`);
    const childIds = [];
    
    // Process sub-groups first
    for (const subName of Object.keys(node.groups)) {
      const subNode = node.groups[subName];
      const subGroupId = processGroup(subNode, `${parentPath}/${node.path}`);
      childIds.push(subGroupId);
    }
    
    // Then files
    for (const f of node.children) {
      childIds.push(f.fileRefId);
    }
    
    groupObjects[groupId] = {
      isa: 'PBXGroup',
      children: childIds,
      path: node.path,
      sourceTree: '<group>'
    };
    
    return groupId;
  }
  
  const rootDinoGroupId = processGroup(folderTree);
  return { groupObjects, rootDinoGroupId };
}

const { groupObjects, rootDinoGroupId } = buildGroups();

// Fixed IDs for base project structure
const projId = "111111111111111111111111";
const targetId = "222222222222222222222222";
const mainGroupId = "333333333333333333333333";
const productsGroupId = "444444444444444444444444";
const productRefId = "666666666666666666666666";
const sourcesPhaseId = "BBBBBBBBBBBBBBBBBBBBBBBB";
const frameworksPhaseId = "CCCCCCCCCCCCCCCCCCCCCCCC";
const resourcesPhaseId = "DDDDDDDDDDDDDDDDDDDDDDDD";
const projConfigListId = "777777777777777777777777";
const targetConfigListId = "888888888888888888888888";

// Assemble pbxproj string
let pbx = `// !$*UTF8*$!\n{\n\tarchiveVersion = 1;\n\tclasses = {};\n\tobjectVersion = 56;\n\tobjects = {\n`;

// 1. PBXProject
pbx += `\t\t${projId} = {isa = PBXProject; attributes = { LastUpgradeCheck = 1600; TargetAttributes = { ${targetId} = { CreatedOnToolsVersion = 16.0; }; }; }; buildConfigurationList = ${projConfigListId}; compatibilityVersion = "Xcode 14.0"; developmentRegion = en; hasScannedForEncodings = 0; knownRegions = (en, Base); mainGroup = ${mainGroupId}; productRefGroup = ${productsGroupId}; projectDirPath = ""; projectRoot = ""; targets = (${targetId}); };\n`;

// 2. PBXNativeTarget
pbx += `\t\t${targetId} = {isa = PBXNativeTarget; buildConfigurationList = ${targetConfigListId}; buildPhases = (${sourcesPhaseId}, ${frameworksPhaseId}, ${resourcesPhaseId}); buildRules = (); dependencies = (); name = DinoEnglish; productName = DinoEnglish; productReference = ${productRefId}; productType = "com.apple.product-type.application"; };\n`;

// 3. Main group & Products group
pbx += `\t\t${mainGroupId} = {isa = PBXGroup; children = (${rootDinoGroupId}, ${productsGroupId}); sourceTree = "<group>"; };\n`;
pbx += `\t\t${productsGroupId} = {isa = PBXGroup; children = (${productRefId}); name = Products; sourceTree = "<group>"; };\n`;
pbx += `\t\t${productRefId} = {isa = PBXFileReference; explicitFileType = wrapper.application; includeInIndex = 0; path = DinoEnglish.app; sourceTree = BUILT_PRODUCTS_DIR; };\n`;

// 4. Folder groups
for (const [gid, gobj] of Object.entries(groupObjects)) {
  const childStr = gobj.children.join(', ');
  pbx += `\t\t${gid} = {isa = PBXGroup; children = (${childStr}); path = "${gobj.path}"; sourceTree = "<group>"; };\n`;
}

// 5. PBXFileReference
for (const f of fileRefs) {
  pbx += `\t\t${f.id} = {isa = PBXFileReference; lastKnownFileType = ${f.lastKnownFileType}; name = "${f.name}"; path = "${f.name}"; sourceTree = "<group>"; };\n`;
}

// 6. PBXBuildFile
for (const b of buildFiles) {
  pbx += `\t\t${b.id} = {isa = PBXBuildFile; fileRef = ${b.fileRef}; };\n`;
}

// 7. PBXSourcesBuildPhase
const sourcesStr = sourcesBuildPhaseFiles.join(', ');
pbx += `\t\t${sourcesPhaseId} = {isa = PBXSourcesBuildPhase; buildActionMask = 2147483647; files = (${sourcesStr}); runOnlyForDeploymentPostprocessing = 0; };\n`;

// 8. PBXFrameworksBuildPhase
pbx += `\t\t${frameworksPhaseId} = {isa = PBXFrameworksBuildPhase; buildActionMask = 2147483647; files = (); runOnlyForDeploymentPostprocessing = 0; };\n`;

// 9. PBXResourcesBuildPhase
const resourcesStr = resourcesBuildPhaseFiles.join(', ');
pbx += `\t\t${resourcesPhaseId} = {isa = PBXResourcesBuildPhase; buildActionMask = 2147483647; files = (${resourcesStr}); runOnlyForDeploymentPostprocessing = 0; };\n`;

// 10. XCConfigurationList & XCBuildConfiguration
pbx += `\t\t${projConfigListId} = {isa = XCConfigurationList; buildConfigurations = (121212121212121212121212, 131313131313131313131313); defaultConfigurationIsVisible = 0; defaultConfigurationName = Release; };\n`;
pbx += `\t\t${targetConfigListId} = {isa = XCConfigurationList; buildConfigurations = (141414141414141414141414, 151515151515151515151515); defaultConfigurationIsVisible = 0; defaultConfigurationName = Release; };\n`;

pbx += `\t\t121212121212121212121212 = {isa = XCBuildConfiguration; buildSettings = { CLANG_ENABLE_MODULES = YES; IPHONEOS_DEPLOYMENT_TARGET = 17.0; SDKROOT = iphoneos; SWIFT_VERSION = 5.0; }; name = Debug; };\n`;
pbx += `\t\t131313131313131313131313 = {isa = XCBuildConfiguration; buildSettings = { CLANG_ENABLE_MODULES = YES; IPHONEOS_DEPLOYMENT_TARGET = 17.0; SDKROOT = iphoneos; SWIFT_VERSION = 5.0; }; name = Release; };\n`;

const targetSettings = `{ ASSETCATALOG_COMPILER_APPICON_NAME = AppIcon; CODE_SIGN_STYLE = Manual; CURRENT_PROJECT_VERSION = 1; GENERATE_INFOPLIST_FILE = NO; INFOPLIST_FILE = DinoEnglish/Info.plist; IPHONEOS_DEPLOYMENT_TARGET = 16.0; MARKETING_VERSION = 1.0; PRODUCT_BUNDLE_IDENTIFIER = com.dinoenglish.kids; PRODUCT_NAME = "$(TARGET_NAME)"; SUPPORTED_PLATFORMS = "iphoneos iphonesimulator"; SWIFT_EMIT_LOC_STRINGS = YES; SWIFT_VERSION = 5.0; TARGETED_DEVICE_FAMILY = "1,2"; }`;

pbx += `\t\t141414141414141414141414 = {isa = XCBuildConfiguration; buildSettings = ${targetSettings}; name = Debug; };\n`;
pbx += `\t\t151515151515151515151515 = {isa = XCBuildConfiguration; buildSettings = ${targetSettings}; name = Release; };\n`;

pbx += `\t};\n\trootObject = ${projId};\n}\n`;

fs.writeFileSync(projectFile, pbx, 'utf-8');
console.log(`Successfully updated ${projectFile} with ${sourcesBuildPhaseFiles.length} source files and ${resourcesBuildPhaseFiles.length} resource files.`);

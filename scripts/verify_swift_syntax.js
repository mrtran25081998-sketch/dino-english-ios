// scripts/verify_swift_syntax.js
const fs = require('fs');
const path = require('path');

function scanDir(dir) {
  let results = [];
  const entries = fs.readdirSync(dir, { withFileTypes: true });
  for (const entry of entries) {
    const full = path.join(dir, entry.name);
    if (entry.isDirectory() && entry.name !== 'Assets.xcassets') {
      results = results.concat(scanDir(full));
    } else if (entry.name.endsWith('.swift')) {
      results.push(full);
    }
  }
  return results;
}

const baseDir = path.resolve(__dirname, '..', 'iOS', 'DinoEnglish');
const swiftFiles = scanDir(baseDir);

console.log(`Checking ${swiftFiles.length} Swift source files for bracket balancing & syntax sanity...`);

let hasError = false;

swiftFiles.forEach(file => {
  const content = fs.readFileSync(file, 'utf-8');
  const rel = path.relative(baseDir, file);
  
  // Check brackets balance (ignoring string literals and comments)
  let brace = 0, bracket = 0, paren = 0;
  let inString = false;
  let inMultiComment = false;
  let inLineComment = false;
  
  for (let i = 0; i < content.length; i++) {
    const c = content[i];
    const next = content[i + 1];
    
    if (inLineComment) {
      if (c === '\n') inLineComment = false;
      continue;
    }
    if (inMultiComment) {
      if (c === '*' && next === '/') {
        inMultiComment = false;
        i++;
      }
      continue;
    }
    if (inString) {
      if (c === '\\') {
        i++; // skip escaped
      } else if (c === '"') {
        inString = false;
      }
      continue;
    }
    
    if (c === '/' && next === '/') {
      inLineComment = true;
      i++;
      continue;
    }
    if (c === '/' && next === '*') {
      inMultiComment = true;
      i++;
      continue;
    }
    if (c === '"') {
      inString = true;
      continue;
    }
    
    if (c === '{') brace++;
    else if (c === '}') brace--;
    else if (c === '[') bracket++;
    else if (c === ']') bracket--;
    else if (c === '(') paren++;
    else if (c === ')') paren--;
    
    if (brace < 0 || bracket < 0 || paren < 0) {
      console.error(`Syntax error in ${rel}: Extra closing delimiter at character ${i}!`);
      hasError = true;
      break;
    }
  }
  
  if (brace !== 0 || bracket !== 0 || paren !== 0) {
    console.error(`Syntax error in ${rel}: Unbalanced delimiters! brace: ${brace}, bracket: ${bracket}, paren: ${paren}`);
    hasError = true;
  }
});

if (!hasError) {
  console.log("All Swift files have perfectly balanced delimiters and clean syntax structure!");
} else {
  process.exit(1);
}

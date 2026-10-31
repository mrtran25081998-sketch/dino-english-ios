const fs = require('fs');
const path = require('path');
const https = require('https');

const fontsDir = path.join(__dirname, '..', 'iOS', 'DinoEnglish', 'Resources', 'Fonts');
if (!fs.existsSync(fontsDir)) {
  fs.mkdirSync(fontsDir, { recursive: true });
}

const fontUrls = {
  'Nunito-Regular.ttf': 'https://fonts.gstatic.com/s/nunito/v32/XRXI3I6Li01BKofiOc5wtlZ2di8HDLshRTM.ttf',
  'Nunito-SemiBold.ttf': 'https://fonts.gstatic.com/s/nunito/v32/XRXI3I6Li01BKofiOc5wtlZ2di8HDGUmRTM.ttf',
  'Nunito-Bold.ttf': 'https://fonts.gstatic.com/s/nunito/v32/XRXI3I6Li01BKofiOc5wtlZ2di8HDFwmRTM.ttf',
  'Nunito-ExtraBold.ttf': 'https://fonts.gstatic.com/s/nunito/v32/XRXI3I6Li01BKofiOc5wtlZ2di8HDDsmRTM.ttf',
  'Nunito-Black.ttf': 'https://fonts.gstatic.com/s/nunito/v32/XRXI3I6Li01BKofiOc5wtlZ2di8HDBImRTM.ttf'
};

function download(filename, url) {
  return new Promise((resolve, reject) => {
    const dest = path.join(fontsDir, filename);
    const file = fs.createWriteStream(dest);
    https.get(url, (response) => {
      response.pipe(file);
      file.on('finish', () => {
        file.close(() => {
          console.log(`Downloaded ${filename} (${fs.statSync(dest).size} bytes)`);
          resolve();
        });
      });
    }).on('error', (err) => {
      fs.unlink(dest, () => {});
      reject(err);
    });
  });
}

async function run() {
  for (const [name, url] of Object.entries(fontUrls)) {
    await download(name, url);
  }
  console.log('All Nunito fonts downloaded successfully.');
}

run().catch(console.error);

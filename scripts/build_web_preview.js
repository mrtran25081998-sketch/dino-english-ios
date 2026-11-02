// scripts/build_web_preview.js
const fs = require('fs');
const path = require('path');

const previewHtmlPath = path.resolve(__dirname, '..', 'web-preview', 'DinoEnglish_3D_Preview.html');
const jsonPath = path.resolve(__dirname, '..', 'iOS', 'DinoEnglish', 'Data', 'DinoContent.json');

const oldHtml = fs.readFileSync(previewHtmlPath, 'utf-8');
const match = oldHtml.match(/const DINO_ASSETS\s*=\s*(\{.+?\});/s);
if (!match) {
  console.error("Could not find DINO_ASSETS in existing HTML!");
  process.exit(1);
}
const dinoAssetsJson = match[1];
const contentDb = JSON.parse(fs.readFileSync(jsonPath, 'utf-8'));

// Tải 2 ảnh nền do người dùng cung cấp
const appBgPath = path.resolve(__dirname, '..', 'assets', 'images', 'app_background.png');
const bannerHocNgayPath = path.resolve(__dirname, '..', 'assets', 'images', 'banner_hoc_ngay.png');

const appBgBase64 = fs.existsSync(appBgPath) ? fs.readFileSync(appBgPath).toString('base64') : '';
const bannerHocNgayBase64 = fs.existsSync(bannerHocNgayPath) ? fs.readFileSync(bannerHocNgayPath).toString('base64') : '';

const appBgDataUrl = appBgBase64 ? `data:image/png;base64,${appBgBase64}` : '';
const bannerHocNgayDataUrl = bannerHocNgayBase64 ? `data:image/png;base64,${bannerHocNgayBase64}` : '';

console.log("Building complete Web Simulator with 1,200 words, custom 3D backgrounds and 14 mascots...");

const htmlTemplate = `<!doctype html>
<html lang="vi">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, viewport-fit=cover">
  <meta name="apple-mobile-web-app-capable" content="yes">
  <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
  <meta name="apple-mobile-web-app-title" content="Dino English">
  <link rel="apple-touch-icon" href="https://raw.githubusercontent.com/mrtran25081998-sketch/dino-english-ios/main/iOS/DinoEnglish/Assets.xcassets/AppIcon.appiconset/AppIcon.png">
  <title>Dino English — Ứng dụng tiếng Anh 3D cho bé</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Nunito:ital,wght@0,400;0,600;0,700;0,800;0,900;1,700;1,800&display=swap" rel="stylesheet">
  <style>
    * {
      box-sizing: border-box;
      -webkit-tap-highlight-color: transparent;
      font-family: 'Nunito', system-ui, -apple-system, sans-serif;
    }
    body {
      margin: 0;
      padding: 20px 10px;
      min-height: 100vh;
      background: radial-gradient(circle at 50% 20%, #d8f5ff 0%, #b8e6cf 50%, #8ed4ad 100%);
      font-family: 'Nunito', system-ui, -apple-system, sans-serif;
      color: #264838;
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
    }
    button, input, select, textarea {
      font-family: 'Nunito', system-ui, -apple-system, sans-serif;
    }
    .header-bar {
      margin-bottom: 14px;
      text-align: center;
    }
    .header-bar h1 {
      margin: 0;
      font-size: 26px;
      font-weight: 900;
      color: #1e7a3d;
      text-shadow: 0 2px 4px rgba(255,255,255,0.8);
    }
    .header-bar p {
      margin: 4px 0 0;
      font-size: 14px;
      font-weight: 700;
      color: #3b6b50;
    }

    /* iPhone 16 Pro Frame Mockup */
    .iphone-frame {
      width: 100%;
      max-width: 420px;
      height: 870px;
      background: #111;
      border-radius: 54px;
      padding: 12px;
      box-shadow: 0 25px 60px rgba(18, 64, 38, 0.35), 0 0 0 4px #444, 0 0 0 7px #2a2a2a;
      position: relative;
      overflow: hidden;
      display: flex;
      flex-direction: column;
    }
    .screen-wrapper {
      width: 100%;
      height: 100%;
      background: ${appBgDataUrl ? `url('${appBgDataUrl}') center top / cover no-repeat,` : ''} linear-gradient(180deg, #83d9ff 0%, #e1faff 34%, #e6ffd8 100%);
      border-radius: 44px;
      overflow: hidden;
      position: relative;
      display: flex;
      flex-direction: column;
    }

    /* Dynamic Island (Floating over header at top) */
    .dynamic-island {
      position: absolute;
      top: 6px;
      left: 50%;
      transform: translateX(-50%);
      width: 114px;
      height: 24px;
      background: #000;
      border-radius: 14px;
      z-index: 1000;
      display: flex;
      align-items: center;
      justify-content: space-between;
      padding: 0 8px;
      pointer-events: none;
    }
    .island-camera {
      width: 8px;
      height: 8px;
      border-radius: 50%;
      background: #151525;
      border: 1px solid #222;
    }
    .island-sensor {
      width: 7px;
      height: 7px;
      border-radius: 50%;
      background: #111;
    }

    /* Content Area (The ONLY scrollable container inside iPhone) */
    .app-viewport {
      flex: 1;
      overflow-y: auto;
      overflow-x: hidden;
      padding: 0 18px 24px;
      display: flex;
      flex-direction: column;
      scrollbar-width: none;
    }
    .app-viewport > * {
      flex-shrink: 0;
    }
    .app-viewport::-webkit-scrollbar { display: none; }

    /* 3D Pastel UI Components */
    .brand-title {
      font-size: 34px;
      font-weight: 900;
      color: #30a953;
      text-shadow: 0 2px 0 #fff;
      display: inline-flex;
      gap: 6px;
      align-items: center;
      justify-content: center;
    }
    .brand-title em {
      font-style: normal;
      color: #ffae11;
    }

    .mascot-box {
      display: flex;
      align-items: center;
      justify-content: center;
      min-height: 140px;
      margin: 8px 0;
    }
    .mascot-img {
      max-width: 100%;
      height: 180px;
      object-fit: contain;
      filter: drop-shadow(0 8px 10px rgba(40, 105, 65, 0.25));
      animation: floatBreath 2.2s ease-in-out infinite alternate;
    }
    .mascot-img.big { height: 230px; }
    .mascot-img.small { height: 110px; }
    .mascot-img.tiny { height: 85px; }

    @keyframes floatBreath {
      0% { transform: translateY(0); }
      100% { transform: translateY(-7px); }
    }

    /* 3D Extruded Pastel Card */
    .dino-card {
      background: rgba(255, 255, 255, 0.96);
      border: 2.5px solid #fff;
      border-radius: 24px;
      padding: 18px;
      margin: 12px 0;
      box-shadow: 0 5px 0 #a8d6b1, 0 10px 20px rgba(57, 115, 75, 0.12);
      position: relative;
    }

    /* 3D Extruded Button */
    .dino-btn {
      width: 100%;
      border: 2.5px solid #fff;
      border-radius: 20px;
      background: linear-gradient(180deg, #ffe95a 0%, #ffb50f 100%);
      font-size: 18px;
      font-weight: 900;
      color: #694408;
      padding: 15px;
      box-shadow: 0 5px 0 #d48a0d;
      cursor: pointer;
      display: flex;
      align-items: center;
      justify-content: center;
      gap: 8px;
      transition: transform 0.1s, box-shadow 0.1s;
      margin-top: 10px;
      user-select: none;
    }
    .dino-btn:active {
      transform: translateY(4px);
      box-shadow: 0 1px 0 #d48a0d;
    }
    .dino-btn.green {
      background: linear-gradient(180deg, #4edb75 0%, #2cb351 100%);
      color: #fff;
      box-shadow: 0 5px 0 #1c7b38;
    }
    .dino-btn.green:active {
      box-shadow: 0 1px 0 #1c7b38;
    }
    .dino-btn.blue {
      background: linear-gradient(180deg, #60beff 0%, #2591f8 100%);
      color: #fff;
      box-shadow: 0 5px 0 #1265b8;
    }
    .dino-btn.blue:active {
      box-shadow: 0 1px 0 #1265b8;
    }
    .dino-btn.purple {
      background: linear-gradient(180deg, #c384ff 0%, #9545ea 100%);
      color: #fff;
      box-shadow: 0 5px 0 #6826ae;
    }
    .dino-btn.purple:active {
      box-shadow: 0 1px 0 #6826ae;
    }
    .dino-btn.coral {
      background: linear-gradient(180deg, #ff7a87 0%, #f73f51 100%);
      color: #fff;
      box-shadow: 0 5px 0 #b31d2b;
    }
    .dino-btn.coral:active {
      box-shadow: 0 1px 0 #b31d2b;
    }

    .dino-outline-btn {
      width: 100%;
      border: 2px solid #84c79d;
      background: #fff;
      border-radius: 18px;
      font-size: 15px;
      font-weight: 800;
      color: #167b4b;
      padding: 12px;
      cursor: pointer;
      margin-top: 8px;
      box-shadow: 0 3px 0 #bde6cb;
    }
    .dino-outline-btn:active {
      transform: translateY(2px);
      box-shadow: 0 1px 0 #bde6cb;
    }

    /* Form Controls */
    .form-group {
      text-align: left;
      margin-bottom: 11px;
    }
    .form-label {
      font-size: 13px;
      font-weight: 800;
      color: #26593a;
      margin-bottom: 4px;
      display: block;
    }
    .form-input {
      width: 100%;
      padding: 12px 14px;
      border: 2px solid #a8d6b1;
      border-radius: 14px;
      font-size: 15px;
      font-weight: 700;
      color: #1e6a39;
      background: #fffdf5;
      outline: none;
      box-sizing: border-box;
      transition: border-color 0.2s, box-shadow 0.2s;
    }
    .form-input:focus {
      border-color: #26a84f;
      box-shadow: 0 0 0 3px rgba(38, 168, 79, 0.15);
      background: #ffffff;
    }
    .input-wrapper {
      position: relative;
      display: flex;
      align-items: center;
    }
    .toggle-pwd-btn {
      position: absolute;
      right: 12px;
      background: transparent;
      border: none;
      cursor: pointer;
      font-size: 18px;
      color: #5b7c6b;
      padding: 0;
    }
    .form-checkbox-label {
      display: flex;
      align-items: flex-start;
      gap: 8px;
      font-size: 12px;
      color: #557763;
      cursor: pointer;
      line-height: 1.4;
      text-align: left;
      margin: 10px 0;
    }
    .form-checkbox-label input {
      margin-top: 2px;
      accent-color: #26a84f;
      cursor: pointer;
    }
    .chip-group {
      display: flex;
      gap: 8px;
    }
    .chip-btn {
      flex: 1;
      padding: 10px 6px;
      border: 2px solid #bce4c8;
      border-radius: 12px;
      background: #fff;
      font-size: 13px;
      font-weight: 800;
      color: #3b6b4e;
      cursor: pointer;
      text-align: center;
      transition: all 0.15s;
    }
    .chip-btn.active {
      border-color: #26a84f;
      background: #eafbee;
      color: #1e7a3d;
      box-shadow: 0 2px 0 #a2d8b3;
    }
    .avatar-grid {
      display: grid;
      grid-template-columns: repeat(4, 1fr);
      gap: 10px;
      margin: 8px 0;
    }
    .avatar-choice {
      border: 2.5px solid #d4ede0;
      border-radius: 16px;
      background: #fff;
      padding: 6px;
      cursor: pointer;
      display: flex;
      align-items: center;
      justify-content: center;
      transition: all 0.15s;
    }
    .avatar-choice.active {
      border-color: #26a84f;
      background: #eafbee;
      transform: scale(1.05);
      box-shadow: 0 4px 10px rgba(38, 168, 79, 0.2);
    }

    /* Grids & Lists */
    .grid-2 {
      display: grid;
      grid-template-columns: 1fr 1fr;
      gap: 12px;
    }
    .tile-card {
      background: #fff;
      border: 2px solid #fff;
      border-radius: 20px;
      padding: 14px;
      box-shadow: 0 4px 0 #b8d8bf, 0 6px 12px rgba(45, 110, 68, 0.08);
      cursor: pointer;
      text-align: left;
      transition: transform 0.15s;
    }
    .tile-card:hover { transform: translateY(-2px); }
    .tile-card:active { transform: translateY(2px); }

    /* Progress bar */
    .progress-bar {
      height: 12px;
      background: #e2ede5;
      border-radius: 12px;
      overflow: hidden;
      margin: 8px 0;
    }
    .progress-fill {
      height: 100%;
      background: linear-gradient(90deg, #4edb75, #2cb351);
      border-radius: 12px;
      transition: width 0.3s;
    }

    /* Bottom Navigation Tab Bar (Fixed at Screen Bottom) */
    .tab-bar {
      flex-shrink: 0;
      position: relative;
      width: 100%;
      background: rgba(255, 255, 255, 0.95);
      backdrop-filter: blur(16px);
      -webkit-backdrop-filter: blur(16px);
      border-top: 1.5px solid #d0ebd4;
      display: grid;
      grid-template-columns: repeat(4, 1fr);
      padding: 8px 6px 14px;
      z-index: 500;
      box-shadow: 0 -4px 18px rgba(18, 64, 38, 0.08);
      box-sizing: border-box;
    }
    .tab-bar::after {
      content: '';
      position: absolute;
      bottom: 4px;
      left: 50%;
      transform: translateX(-50%);
      width: 120px;
      height: 4px;
      background: #1e3a2b;
      border-radius: 2px;
      opacity: 0.35;
    }
    .home-indicator {
      position: absolute;
      bottom: 8px;
      left: 50%;
      transform: translateX(-50%);
      width: 124px;
      height: 4.5px;
      background: #1e3a2b;
      border-radius: 3px;
      opacity: 0.35;
      z-index: 600;
      pointer-events: none;
      display: none;
    }
    .tab-btn {
      background: transparent;
      border: 0;
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      gap: 2px;
      font-size: 11px;
      font-weight: 800;
      color: #608271;
      cursor: pointer;
      padding: 2px 0;
    }
    .tab-btn.active {
      color: #26a84f;
    }
    .tab-btn span {
      font-size: 20px;
      line-height: 1.2;
    }

    /* Header Nav (Sticky / Fixed at top when scrolling, Clean White Background, Exactly 80px Total Height) */
    .top-header {
      position: sticky;
      top: 0;
      z-index: 100;
      display: flex;
      align-items: center;
      justify-content: space-between;
      height: 80px !important;
      min-height: 80px !important;
      max-height: 80px !important;
      box-sizing: border-box !important;
      margin: 0 -18px 12px;
      padding: 34px 18px 8px;
      background: #ffffff;
      border-bottom: 1.5px solid #e0ebe4;
      box-shadow: 0 4px 16px rgba(20, 60, 40, 0.05);
    }
    .top-header h2 {
      margin: 0;
      font-size: 19px;
      line-height: 36px;
    }
    .top-header.home-header {
      background: transparent !important;
      border-bottom: none !important;
      box-shadow: none !important;
    }
    .back-btn {
      background: #fff;
      border: 2px solid #bfe4cb;
      border-radius: 12px;
      width: 36px;
      height: 36px;
      min-width: 36px;
      min-height: 36px;
      padding: 0;
      font-weight: 900;
      font-size: 18px;
      color: #1e7a3d;
      box-shadow: 0 2px 0 #a2d8b3;
      cursor: pointer;
      display: inline-flex;
      align-items: center;
      justify-content: center;
      touch-action: manipulation;
      transition: transform 0.1s, box-shadow 0.1s;
    }
    .back-btn:active {
      transform: translateY(2px);
      box-shadow: 0 1px 0 #a2d8b3;
    }

    .badge-star {
      background: #fff3c9;
      border: 1.5px solid #f6cf65;
      padding: 4px 10px;
      border-radius: 16px;
      font-weight: 800;
      font-size: 13px;
      color: #8c5b05;
      display: inline-flex;
      align-items: center;
      gap: 4px;
      box-shadow: 0 2px 4px rgba(255, 174, 17, 0.2);
    }

    /* Flashcard Style */
    .flashcard {
      text-align: center;
      padding: 24px 16px;
    }
    .word-illustration-badge {
      width: 108px;
      height: 108px;
      margin: 4px auto 14px;
      background: radial-gradient(circle, #eafae8 0%, #d5f7d2 100%);
      border: 3.5px solid #fff;
      border-radius: 50%;
      display: flex;
      align-items: center;
      justify-content: center;
      box-shadow: 0 6px 0 #b3dfbe, 0 10px 20px rgba(38, 168, 79, 0.15);
      animation: floatBadge 3s ease-in-out infinite;
    }
    .word-emoji {
      font-size: 58px;
      line-height: 1;
      filter: drop-shadow(0 4px 6px rgba(0,0,0,0.12));
    }
    @keyframes floatBadge {
      0%, 100% { transform: translateY(0); }
      50% { transform: translateY(-5px); }
    }
    .flash-word {
      font-size: 38px;
      font-weight: 900;
      color: #1e7a3d;
      margin: 4px 0 4px;
    }
    .flash-ipa {
      display: inline-block;
      font-family: monospace;
      font-size: 18px;
      font-weight: 700;
      color: #e54b60;
      background: #ffe6ea;
      padding: 4px 14px;
      border-radius: 14px;
      margin-bottom: 8px;
    }
    .flash-vi {
      font-size: 22px;
      font-weight: 800;
      color: #264838;
      margin: 6px 0;
    }
    .flash-ex {
      background: #fffdf5;
      border: 1px solid #e8ebd5;
      border-radius: 16px;
      padding: 10px 14px;
      margin-top: 10px;
      font-size: 14px;
    }

    /* Quiz buttons */
    .quiz-btn {
      width: 100%;
      background: #fff;
      border: 2.5px solid #e1d5fa;
      border-radius: 18px;
      padding: 14px;
      margin: 6px 0;
      font-size: 17px;
      font-weight: 800;
      color: #4b2a82;
      box-shadow: 0 4px 0 #cfbeef;
      cursor: pointer;
      text-align: left;
      display: flex;
      align-items: center;
      justify-content: space-between;
    }
    .quiz-btn.correct {
      background: #e1fbe8;
      border-color: #38c863;
      color: #167a36;
      box-shadow: 0 4px 0 #289b4b;
    }
    .quiz-btn.wrong {
      background: #ffe6ea;
      border-color: #fa556c;
      color: #9c1c2c;
      box-shadow: 0 4px 0 #c2293e;
    }

    /* Speech box */
    .mic-button {
      width: 80px;
      height: 80px;
      border-radius: 50%;
      border: 4px solid #fff;
      background: linear-gradient(135deg, #3aa6ff, #1977e6);
      color: #fff;
      font-size: 34px;
      box-shadow: 0 6px 0 #1052a3, 0 10px 20px rgba(25, 119, 230, 0.35);
      cursor: pointer;
      display: flex;
      align-items: center;
      justify-content: center;
      margin: 14px auto;
      transition: transform 0.2s;
    }
    .mic-button.listening {
      background: linear-gradient(135deg, #ff4d64, #d91c35);
      box-shadow: 0 6px 0 #940e1f;
      animation: pulseMic 1s infinite;
    }
    @keyframes pulseMic {
      0% { transform: scale(1); }
      50% { transform: scale(1.1); }
      100% { transform: scale(1); }
    }

    /* Form Controls & Auth Styles */
    .form-group {
      margin-bottom: 12px;
      text-align: left;
    }
    .form-label {
      display: block;
      font-size: 13px;
      font-weight: 800;
      color: #235438;
      margin-bottom: 5px;
    }
    .input-wrapper {
      position: relative;
      display: flex;
      align-items: center;
    }
    .form-input {
      width: 100%;
      padding: 12px 14px;
      border: 2px solid #bce4c8;
      border-radius: 14px;
      font-size: 14px;
      font-weight: 700;
      color: #1e6a39;
      background: #fff;
      box-sizing: border-box;
      outline: none;
      transition: all 0.2s;
    }
    .form-input:focus {
      border-color: #28a44c;
      background: #fffdfa;
      box-shadow: 0 0 0 3px rgba(40, 164, 76, 0.18);
    }
    .toggle-pwd-btn {
      position: absolute;
      right: 12px;
      background: transparent;
      border: none;
      cursor: pointer;
      font-size: 17px;
      padding: 4px;
      color: #557763;
    }
    .chip-group {
      display: flex;
      gap: 8px;
    }
    .chip-btn {
      flex: 1;
      padding: 10px 6px;
      border: 2px solid #bce4c8;
      border-radius: 14px;
      background: #fff;
      color: #346045;
      font-weight: 800;
      font-size: 13px;
      cursor: pointer;
      text-align: center;
      transition: all 0.2s;
    }
    .chip-btn.active {
      background: #28a44c;
      color: #fff;
      border-color: #1e7a3d;
      box-shadow: 0 3px 0 #185e2f;
    }
    .avatar-grid {
      display: grid;
      grid-template-columns: repeat(4, 1fr);
      gap: 8px;
      margin: 10px 0;
    }
    .avatar-choice {
      border: 2.5px solid #cfead6;
      border-radius: 16px;
      padding: 6px;
      cursor: pointer;
      background: #fff;
      transition: all 0.2s;
      display: flex;
      flex-direction: column;
      align-items: center;
    }
    .avatar-choice.active {
      border-color: #28a44c;
      background: #eafbee;
      box-shadow: 0 4px 0 #185e2f;
      transform: translateY(-2px);
    }
    .terms-checkbox {
      display: flex;
      align-items: flex-start;
      gap: 8px;
      font-size: 12px;
      color: #4c6f5a;
      text-align: left;
      margin: 12px 0;
      line-height: 1.4;
    }
    .error-banner {
      background: #ffe8ea;
      border: 1.5px solid #ff7a88;
      color: #b81427;
      font-size: 13px;
      font-weight: 700;
      padding: 8px 12px;
      border-radius: 12px;
      margin-bottom: 12px;
      text-align: left;
      display: flex;
      align-items: center;
      gap: 6px;
    }
    .success-banner {
      background: #eafbee;
      border: 1.5px solid #63c983;
      color: #166933;
      font-size: 13px;
      font-weight: 700;
      padding: 8px 12px;
      border-radius: 12px;
      margin-bottom: 12px;
      text-align: left;
      display: flex;
      align-items: center;
      gap: 6px;
    }
    .stat-card {
      background: #fff;
      border: 2px solid #d4ecd9;
      border-radius: 16px;
      padding: 10px 8px;
      text-align: center;
      box-shadow: 0 3px 0 #b3dfbe;
    }

    /* Tối ưu toàn màn hình khi mở trên iPhone thực tế */
    @media (max-width: 600px) {
      body {
        padding: 0 !important;
        margin: 0 !important;
        width: 100vw !important;
        height: 100vh !important;
        height: 100dvh !important;
        overflow: hidden !important;
        background: #83d9ff !important;
      }
      .header-bar {
        display: none !important;
      }
      .iphone-frame {
        max-width: 100vw !important;
        width: 100vw !important;
        height: 100vh !important;
        height: 100dvh !important;
        border-radius: 0 !important;
        padding: 0 !important;
        border: none !important;
        box-shadow: none !important;
      }
      .screen-wrapper {
        border-radius: 0 !important;
        padding-top: 0 !important;
      }
      .app-viewport {
        padding: 0 16px 20px !important;
      }
      .top-header {
        margin: 0 -16px 10px !important;
        height: 80px !important;
        min-height: 80px !important;
        max-height: 80px !important;
        padding: 34px 16px 8px !important;
      }
      .top-header.home-header {
        background: transparent !important;
        border-bottom: none !important;
        box-shadow: none !important;
      }
      .dynamic-island {
        display: none !important;
      }
      .home-bar,
      .home-indicator {
        display: none !important;
      }
    }
  </style>
  <script src="https://cdn.jsdelivr.net/npm/@supabase/supabase-js@2"></script>
</head>
<body>

  <div class="header-bar">
    <h1>🦖 Dino English — Web Simulator (Windows Edition)</h1>
    <p>12 Chủ đề · 120 Bài học · 1,200 Từ vựng · 14 Linh vật Dino 3D</p>
  </div>

  <div class="iphone-frame">
    <div class="screen-wrapper" id="screenWrapper">
      <!-- Dynamic Island -->
      <div class="dynamic-island">
        <div class="island-camera"></div>
        <div class="island-sensor"></div>
      </div>

      <!-- App Screen Content Root -->
      <div class="app-viewport" id="appViewport"></div>

      <!-- Bottom Nav Bar (Permanently Fixed to iPhone Bottom) -->
      <div class="tab-bar" id="tabBar" style="display:none;">
        <button class="tab-btn active" onclick="navigate('home')">
          <span>🏠</span>Trang chủ
        </button>
        <button class="tab-btn" onclick="navigate('topics')">
          <span>📚</span>Chủ đề
        </button>
        <button class="tab-btn" onclick="navigate('growth')">
          <span>🦖</span>Dino
        </button>
        <button class="tab-btn" onclick="navigate('profile')">
          <span>😊</span>Hồ sơ
        </button>
      </div>

      <!-- Home Indicator (Visible when TabBar is hidden) -->
      <div class="home-indicator" id="homeIndicator"></div>
    </div>
  </div>

  <script>
    // Embedded 14 3D Mascot Assets
    const DINO_ASSETS = ${dinoAssetsJson};

    // Full 1,200 Words Database
    const DINO_DB = ${JSON.stringify(contentDb)};

    // App State - Tự động ghi nhớ đăng nhập và trạng thái Onboarding
    const savedUser = JSON.parse(localStorage.getItem('dino_supabase_user') || 'null');
    const onboardCompleted = localStorage.getItem('dino_onboard_completed') === 'true';
    const rememberedEmail = localStorage.getItem('dino_remember_email') || '';

    let state = {
      view: savedUser ? 'home' : (onboardCompleted ? 'login' : 'onboard'),
      onboardStep: 0,
      kidName: (function() {
        const n = localStorage.getItem('dino_kid_name');
        if (!n || n.includes('Ã') || n.includes('')) return 'Bé Na';
        return n;
      })(),
      stars: parseInt(localStorage.getItem('dino_stars') || '15', 10),
      streak: 3,
      completedLessons: JSON.parse(localStorage.getItem('dino_completed_lessons') || '[]'),
      completedActivities: JSON.parse(localStorage.getItem('dino_completed_activities') || '[]'),
      currentTopicId: 'animals',
      currentLessonId: 1,
      cardIndex: 0,
      quizRound: 0,
      quizScore: 0,
      quizAnswered: false,
      selectedAnswer: null,
      quizQuestions: [],
      songLine: 0,
      isListening: false,
      recognizedText: '',
      speechRate: 0.85,
      // Supabase Backend Integration (Project: wsaalmeuduiyqbptnrmy)
      supabaseUrl: 'https://wsaalmeuduiyqbptnrmy.supabase.co',
      supabaseKey: (localStorage.getItem('dino_supabase_key') && localStorage.getItem('dino_supabase_key').length > 20) ? localStorage.getItem('dino_supabase_key') : 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6IndzYWFsbWV1ZHVpeXFicHRucm15Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3OTM0NzE0OTgsImV4cCI6MjEwOTA0NzQ5OH0.y29cwhH60cdwJPcQSZ88ryU3b9gTNAO-BViMeHCUN-0',
      supabaseUser: savedUser,
      supabaseClient: null,
      parentProfile: null,
      children: [],
      activeChildId: localStorage.getItem('dino_active_child_id') || null,
      activeChild: null,
      showPassword: false,
      showConfirmPassword: false,
      signupFormData: {
        fullName: '',
        email: '',
        password: '',
        confirmPassword: ''
      },
      loginFormData: {
        email: rememberedEmail,
        password: ''
      },
      pendingVerifyEmail: '',
      selectedAvatar: 'welcome',
      selectedAgeGroup: '6-8',
      isSubmitting: false,
      syncStatus: ''
    };

    function saveState() {
      localStorage.setItem('dino_kid_name', state.kidName);
      localStorage.setItem('dino_stars', state.stars);
      localStorage.setItem('dino_completed_lessons', JSON.stringify(state.completedLessons));
      localStorage.setItem('dino_completed_activities', JSON.stringify(state.completedActivities));
      if (state.supabaseKey) localStorage.setItem('dino_supabase_key', state.supabaseKey);
      if (state.activeChildId) localStorage.setItem('dino_active_child_id', state.activeChildId);
      if (state.supabaseUser) {
        localStorage.setItem('dino_supabase_user', JSON.stringify(state.supabaseUser));
      } else {
        localStorage.removeItem('dino_supabase_user');
      }
    }

    function initSupabase() {
      if (window.supabase && state.supabaseKey) {
        try {
          state.supabaseClient = window.supabase.createClient(state.supabaseUrl, state.supabaseKey, {
            auth: {
              persistSession: true,
              autoRefreshToken: true,
              detectSessionInUrl: true
            }
          });
        } catch (e) {
          console.warn('Supabase client error:', e);
        }
      }
    }

    async function initSessionAndRouting() {
      if (window.location.hash.includes('type=recovery')) {
        state.view = 'reset_password';
        render();
        return;
      }

      if (window.location.hash.includes('type=signup') || window.location.hash.includes('type=email_change')) {
        try {
          if (state.supabaseClient) await state.supabaseClient.auth.signOut();
        } catch(e){}
        window.location.hash = '';
        state.authSuccess = "🎉 Xác thực tài khoản thành công! Vui lòng đăng nhập để bắt đầu học.";
        state.authError = '';
        state.view = 'login';
        render();
        return;
      }

      initSupabase();
      if (state.supabaseClient) {
        try {
          const { data: { session } } = await state.supabaseClient.auth.getSession();
          if (session && session.user) {
            localStorage.setItem('dino_onboard_completed', 'true');
            await handleSessionSuccess(session.user);
          } else {
            if (state.supabaseUser) {
              state.supabaseUser = null;
              saveState();
            }
            if (localStorage.getItem('dino_onboard_completed') === 'true' && state.view === 'onboard') {
              state.view = 'login';
              render();
            }
          }
        } catch (err) {
          console.warn("Session check error:", err);
        }

        state.supabaseClient.auth.onAuthStateChange(async (event, session) => {
          if (event === 'SIGNED_IN' && session && session.user) {
            localStorage.setItem('dino_onboard_completed', 'true');
            await handleSessionSuccess(session.user);
          } else if (event === 'SIGNED_OUT') {
            state.supabaseUser = null;
            state.parentProfile = null;
            state.children = [];
            state.activeChild = null;
            saveState();
            localStorage.setItem('dino_onboard_completed', 'true');
            navigate('login');
          } else if (event === 'PASSWORD_RECOVERY') {
            state.view = 'reset_password';
            render();
          }
        });
      }
    }

    async function handleSessionSuccess(user) {
      state.supabaseUser = { id: user.id, email: user.email };
      localStorage.setItem('dino_onboard_completed', 'true');
      saveState();

      try {
        const { data: profile } = await state.supabaseClient
          .from('profiles')
          .select('*')
          .eq('id', user.id)
          .maybeSingle();
        state.parentProfile = profile || { id: user.id, email: user.email, full_name: 'Phụ huynh' };
      } catch (e) {
        console.warn("Load profile error:", e);
      }

      try {
        const { data: kids } = await state.supabaseClient
          .from('children')
          .select('*')
          .eq('parent_id', user.id)
          .order('created_at', { ascending: true });
        state.children = kids || [];
      } catch (e) {
        console.warn("Load children error:", e);
      }

      if (!state.children || state.children.length === 0) {
        navigate('child_setup');
      } else {
        const savedChildId = state.activeChildId || localStorage.getItem('dino_active_child_id');
        const currentKid = state.children.find(k => k.id === savedChildId) || state.children[0];
        await setActiveChild(currentKid.id);
        navigate('home');
      }
    }

    async function setActiveChild(childId) {
      state.activeChildId = childId;
      const kid = state.children.find(k => k.id === childId);
      if (kid) {
        state.activeChild = kid;
        state.kidName = kid.display_name;
      }
      localStorage.setItem('dino_active_child_id', childId);

      if (state.supabaseClient) {
        try {
          const { data: dino } = await state.supabaseClient
            .from('dino_progress')
            .select('*')
            .eq('child_id', childId)
            .maybeSingle();

          if (dino) {
            state.stars = dino.total_stars;
          }

          const { data: progress } = await state.supabaseClient
            .from('learning_progress')
            .select('lesson_id, status')
            .eq('child_id', childId)
            .eq('status', 'completed');

          if (progress) {
            state.completedLessons = progress.map(p => p.lesson_id);
          }
        } catch (e) {
          console.warn("Load child progress error:", e);
        }
      }
      saveState();
      render();
    }

    function getDinoImg(name, sizeClass = '') {
      const src = DINO_ASSETS[name] || DINO_ASSETS['home'];
      return \`<img src="\${src}" class="mascot-img \${sizeClass}" alt="\${name}">\`;
    }

    let cachedEnVoice = null;
    let cachedViVoice = null;

    function initVoices() {
      if (!('speechSynthesis' in window)) return;
      const voices = window.speechSynthesis.getVoices();
      if (!voices || voices.length === 0) return;

      // Tìm giọng đọc tiếng Anh tự nhiên chất lượng cao (ưu tiên giọng Natural / Google / Studio)
      const en = voices.filter(v => v.lang && (v.lang === 'en-US' || v.lang.startsWith('en')));
      cachedEnVoice = en.find(v => v.name.includes('Natural') || v.name.includes('Online')) ||
                      en.find(v => v.name.includes('Google') || v.name.includes('Premium')) ||
                      en.find(v => v.name.includes('Samantha') || v.name.includes('Jenny') || v.name.includes('Zira') || v.name.includes('Ava')) ||
                      en[0] || null;

      // Tìm giọng tiếng Việt khi phát âm câu dịch tiếng Việt
      const vi = voices.filter(v => v.lang && (v.lang === 'vi-VN' || v.lang.startsWith('vi')));
      cachedViVoice = vi.find(v => v.name.includes('Natural') || v.name.includes('Online') || v.name.includes('Google')) ||
                      vi.find(v => v.name.includes('An') || v.name.includes('Linh') || v.name.includes('HoaiMy')) ||
                      vi[0] || null;
    }

    if ('speechSynthesis' in window) {
      window.speechSynthesis.onvoiceschanged = initVoices;
      initVoices();
    }

    let speechTimer = null;
    function speakText(text) {
      if (!('speechSynthesis' in window) || !text) return;
      
      // Chống rè / vấp âm do cancel() đột ngột
      clearTimeout(speechTimer);
      window.speechSynthesis.cancel();

      speechTimer = setTimeout(() => {
        try {
          initVoices();
          const cleanText = text.toString().trim();
          const u = new SpeechSynthesisUtterance(cleanText);

          // Nhận diện ngôn ngữ thông minh: Tiếng Anh đọc giọng bản ngữ Mỹ, Tiếng Việt đọc giọng Việt
          const isVi = /[àáảãạăắằẳẵặâấầẩẫậèéẻẽẹêếềểễệìíỉĩịòóỏõọôốồổỗộơớờởỡợùúủũụưứừửữựỳýỷỹỵđ]/i.test(cleanText);
          if (isVi) {
            u.lang = 'vi-VN';
            if (cachedViVoice) u.voice = cachedViVoice;
          } else {
            u.lang = 'en-US';
            if (cachedEnVoice) u.voice = cachedEnVoice;
          }

          u.rate = state.speechRate || 0.88;
          u.pitch = 1.0;
          u.volume = 1.0;
          window.speechSynthesis.speak(u);
        } catch(e) {
          console.warn("Speech error:", e);
        }
      }, 40);
    }

    function getTopic(id) {
      return DINO_DB.topics.find(t => t.id === id) || DINO_DB.topics[0];
    }

    function getLesson(topicId, lessonId) {
      const t = getTopic(topicId);
      return t.lessons.find(l => l.lessonId === lessonId) || t.lessons[0];
    }

    function getNextLessonInfo() {
      const currentTopic = getTopic(state.currentTopicId);
      const currentLesson = getLesson(state.currentTopicId, state.currentLessonId);

      // Tìm bài học kế tiếp trong cùng chủ đề
      const nextL = currentTopic.lessons.find(l => l.lessonId === state.currentLessonId + 1);
      if (nextL) {
        return {
          topic: currentTopic,
          lesson: nextL,
          isNewTopic: false
        };
      }

      // Nếu đã hết 10 bài của chủ đề này, tự động chuyển sang Bài 1 của Chủ đề tiếp theo
      const curTopicIdx = DINO_DB.topics.findIndex(t => t.id === state.currentTopicId);
      if (curTopicIdx >= 0 && curTopicIdx + 1 < DINO_DB.topics.length) {
        const nextT = DINO_DB.topics[curTopicIdx + 1];
        if (nextT.lessons && nextT.lessons.length > 0) {
          return {
            topic: nextT,
            lesson: nextT.lessons[0],
            isNewTopic: true
          };
        }
      }
      return null;
    }

    function startNextLesson(topicId, lessonId) {
      state.currentTopicId = topicId;
      state.currentLessonId = lessonId;
      state.cardIndex = 0;
      state.songLine = 0;
      state.recognizedText = '';
      saveState();
      navigate('activity_hub');
    }

    const DINO_MILESTONES = [
      { level: 1, title: "Trứng Vàng Nứt Vỏ", stageName: "Dino Sơ Sinh", requiredLessons: 1, mascot: "level1", badge: "✨", desc: "Dino chào đời và bắt đầu làm quen với những từ vựng đầu tiên!" },
      { level: 2, title: "Chập Chững Khám Phá", stageName: "Dino Sơ Sinh", requiredLessons: 2, mascot: "level1", badge: "🐾", desc: "Dino biết tập đi và bắt chước tiếng kêu của muôn loài." },
      { level: 3, title: "Đôi Mắt Tò Mò", stageName: "Dino Sơ Sinh", requiredLessons: 4, mascot: "level1", badge: "👀", desc: "Dino mở to đôi mắt nhìn ngắm muôn màu sắc rực rỡ." },
      { level: 4, title: "Nụ Cười Rạng Rỡ", stageName: "Dino Sơ Sinh", requiredLessons: 6, mascot: "level1", badge: "😊", desc: "Dino mỉm cười vui sướng khi nhận được thật nhiều ngôi sao." },
      { level: 5, title: "Đôi Chân Nhanh Nhẹn", stageName: "Dino Sơ Sinh", requiredLessons: 8, mascot: "level1", badge: "⚡", desc: "Dino chạy tung tăng trên đồng cỏ xanh mát." },

      { level: 6, title: "Ba Lô Nhỏ Xinh", stageName: "Dino Năng Động", requiredLessons: 10, mascot: "level2", badge: "🎒", desc: "Dino đeo chiếc ba lô vàng xinh xắn sẵn sàng đến trường." },
      { level: 7, title: "Người Bạn Thân Thiết", stageName: "Dino Năng Động", requiredLessons: 12, mascot: "level2", badge: "🤝", desc: "Dino kết thêm nhiều người bạn mới trong lớp học." },
      { level: 8, title: "Phát Âm Rõ Ràng", stageName: "Dino Năng Động", requiredLessons: 15, mascot: "level2", badge: "🎤", desc: "Dino nói tiếng Anh thật tròn vành rõ chữ." },
      { level: 9, title: "Nhà Thám Hiểm Nhí", stageName: "Dino Năng Động", requiredLessons: 18, mascot: "level2", badge: "🧭", desc: "Dino khám phá thế giới tự nhiên và các phương tiện giao thông." },
      { level: 10, title: "Vượt Thử Thách", stageName: "Dino Năng Động", requiredLessons: 20, mascot: "level2", badge: "⭐", desc: "Dino hoàn thành xuất sắc 20 bài học đầu tiên!" },

      { level: 11, title: "Tủ Sách Kỳ Diệu", stageName: "Dino Thông Thái", requiredLessons: 25, mascot: "level3", badge: "📚", desc: "Dino mở trang sách thần kỳ chứa đầy từ vựng thú vị." },
      { level: 12, title: "Ngôi Sao Đố Vui", stageName: "Dino Thông Thái", requiredLessons: 30, mascot: "level3", badge: "🧩", desc: "Dino trả lời đúng mọi câu hỏi trong các trò chơi." },
      { level: 13, title: "Ca Sĩ Nhí", stageName: "Dino Thông Thái", requiredLessons: 35, mascot: "level3", badge: "🎵", desc: "Dino hát vang những giai điệu tiếng Anh rộn ràng." },
      { level: 14, title: "Hiệp Sĩ Tử Tế", stageName: "Dino Thông Thái", requiredLessons: 40, mascot: "level3", badge: "🛡️", desc: "Dino luôn biết chia sẻ, cảm ơn và giúp đỡ bạn bè." },
      { level: 15, title: "Bậc Thầy Trí Nhớ", stageName: "Dino Thông Thái", requiredLessons: 50, mascot: "level3", badge: "🧠", desc: "Dino ghi nhớ hàng trăm từ vựng của nhiều chủ đề khác nhau!" },

      { level: 16, title: "Hành Trình Bứt Phá", stageName: "Dino Trưởng Thành", requiredLessons: 60, mascot: "level4", badge: "🚀", desc: "Dino bước vào giai đoạn trưởng thành vững vàng." },
      { level: 17, title: "Ngôi Sao Sáng Ngời", stageName: "Dino Trưởng Thành", requiredLessons: 75, mascot: "level4", badge: "🌟", desc: "Dino tự tin giao tiếp và thể hiện tình yêu tiếng Anh." },
      { level: 18, title: "Nhà Vô Địch Học Tập", stageName: "Dino Trưởng Thành", requiredLessons: 90, mascot: "level4", badge: "🏆", desc: "Dino đạt danh hiệu vô địch với bộ sưu tập sao khổng lồ." },
      { level: 19, title: "Tiến Đến Đỉnh Cao", stageName: "Dino Trưởng Thành", requiredLessons: 105, mascot: "level4", badge: "🏁", desc: "Chỉ còn một bước nữa là Dino sẽ tốt nghiệp hoàn hảo!" },
      { level: 20, title: "Thủ Khoa Toàn Năng", stageName: "Dino Trưởng Thành", requiredLessons: 120, mascot: "level4", badge: "👑", desc: "Dino vinh dự đội chiếc mũ cử nhân tốt nghiệp toàn khóa 120 bài học!" }
    ];

    function getEvolutionMilestone(completedCount) {
      const count = completedCount !== undefined ? completedCount : state.completedLessons.length;
      let active = DINO_MILESTONES[0];
      for (const m of DINO_MILESTONES) {
        if (count >= m.requiredLessons) {
          active = m;
        } else {
          break;
        }
      }
      return active;
    }

    function getEvolutionLevel() {
      return getEvolutionMilestone().level;
    }

    function getMilestoneMascot() {
      return getEvolutionMilestone().mascot;
    }

    function rewardPoints(topicId, lessonId, activityKey, points) {
      const key = \`\${topicId}_l\${lessonId}_\${activityKey}\`;
      if (!state.completedActivities.includes(key)) {
        state.completedActivities.push(key);
        state.stars += points;
      }
      const lKey = \`\${topicId}_l\${lessonId}\`;
      if (!state.completedLessons.includes(lKey)) {
        state.completedLessons.push(lKey);
      }
      saveState();
      syncLessonToSupabase(topicId, lessonId, activityKey, points);
    }

    function updateNav() {
      const tabBar = document.getElementById('tabBar');
      const homeIndicator = document.getElementById('homeIndicator');
      const rootTabs = ['home', 'topics', 'growth', 'profile'];
      const isRootTab = rootTabs.includes(state.view);

      if (tabBar) tabBar.style.display = isRootTab ? 'grid' : 'none';
      if (homeIndicator) homeIndicator.style.display = isRootTab ? 'none' : 'block';

      // Update active tab button
      document.querySelectorAll('.tab-btn').forEach((btn, idx) => {
        btn.classList.toggle('active', rootTabs[idx] === state.view);
      });
    }

    function navigate(viewName, params = {}) {
      state.view = viewName;
      if (params.topicId) state.currentTopicId = params.topicId;
      if (params.lessonId) state.currentLessonId = params.lessonId;
      if (params.cardIndex !== undefined) state.cardIndex = params.cardIndex;
      
      const vp = document.getElementById('appViewport');
      if (vp) vp.scrollTop = 0;
      const sw = document.getElementById('screenWrapper');
      if (sw) sw.scrollTop = 0;
      render();
    }

    function render() {
      updateNav();
      const root = document.getElementById('appViewport');
      let html = '';

      switch (state.view) {
        case 'onboard':
          const slides = [
            { title: "Cùng Dino Khám Phá Tiếng Anh!", desc: "Từ vựng chuẩn, phát âm, trò chơi đố vui và bài hát rộn ràng mỗi ngày.", mascot: "welcome" },
            { title: "Học Vui Qua Tương Tác 3D", desc: "Nghe phát âm bản ngữ, luyện nói cùng micro và chọn hình nhận sao lấp lánh.", mascot: "game" },
            { title: "Dino Lớn Lên Cùng Bé", desc: "Tích sao vàng mở khóa 20 cột mốc trưởng thành kỳ diệu của Dino!", mascot: "level4" }
          ];
          const curr = slides[state.onboardStep];
          html = \`
            <div style="text-align:center; padding:44px 0 10px;">
              <div class="brand-title">Dino <em>English</em></div>
              <div class="mascot-box">\${getDinoImg(curr.mascot, 'big')}</div>
              <div class="dino-card">
                <h2 style="color:#2a974b; margin:6px 0 10px; font-size:22px;">\${curr.title}</h2>
                <p style="color:#577464; font-size:14px; line-height:1.4; margin:0;">\${curr.desc}</p>
              </div>
              <div style="margin:14px 0; display:flex; justify-content:center; gap:8px;">
                \${slides.map((_, i) => \`<div style="width:\${i===state.onboardStep?28:10}px; height:9px; border-radius:10px; background:\${i===state.onboardStep?'#2a974b':'#c7ded0'}; transition:width 0.2s;"></div>\`).join('')}
              </div>
              <button class="dino-btn" onclick="nextOnboard()">\${state.onboardStep === 2 ? 'Bắt Đầu Ngay 🚀' : 'Tiếp Theo ➔'}</button>
              <button class="dino-outline-btn" onclick="localStorage.setItem('dino_onboard_completed','true'); navigate('login')">Bỏ qua giới thiệu</button>
            </div>
          \`;
          break;

        case 'login':
          html = \`
            <div style="text-align:center; padding:24px 0 16px;">
              <div class="brand-title">Dino <em>English</em></div>
              <div class="mascot-box" style="margin:4px 0 8px;">\${getDinoImg('welcome', 'small')}</div>
              
              <div class="dino-card" style="text-align:left;">
                <h3 style="color:#1d703b; margin:0 0 4px; font-size:20px; text-align:center; font-weight:900;">Đăng Nhập Phụ Huynh</h3>
                <p style="color:#577464; font-size:13px; margin:0 0 14px; text-align:center;">Ghi nhớ bài học & đồng bộ tiến độ của bé trên đám mây</p>

                \${state.authError ? \`<div class="error-banner"><span>⚠️</span> \${state.authError}</div>\` : ''}
                \${state.authSuccess ? \`<div class="success-banner"><span>✅</span> \${state.authSuccess}</div>\` : ''}

                <div class="form-group">
                  <label class="form-label">Email Phụ Huynh</label>
                  <input id="loginEmail" type="email" class="form-input" placeholder="ba_me@example.com" value="\${state.loginFormData?.email || state.pendingVerifyEmail || ''}" oninput="state.loginFormData.email=this.value">
                </div>

                <div class="form-group">
                  <div style="display:flex; justify-content:space-between; align-items:center; margin-bottom:5px;">
                    <label class="form-label" style="margin:0;">Mật Khẩu</label>
                    <a href="javascript:void(0)" onclick="state.authError=''; navigate('forgot_password')" style="font-size:12px; color:#239446; font-weight:800; text-decoration:none;">Quên mật khẩu?</a>
                  </div>
                  <div class="input-wrapper">
                    <input id="loginPassword" type="\${state.showPassword ? 'text' : 'password'}" class="form-input" placeholder="Nhập mật khẩu" style="padding-right:42px;" value="\${state.loginFormData?.password || ''}" oninput="state.loginFormData.password=this.value">
                    <button type="button" class="toggle-pwd-btn" onclick="togglePasswordVisibility('login')">
                      \${state.showPassword ? '🙈' : '👁️'}
                    </button>
                  </div>
                </div>

                <!-- Ghi nhớ đăng nhập -->
                <div style="display:flex; align-items:center; margin:12px 0 16px;">
                  <label style="display:flex; align-items:center; gap:8px; font-size:13px; color:#3d6550; font-weight:700; cursor:pointer;">
                    <input id="rememberMe" type="checkbox" checked style="accent-color:#28a44c; width:18px; height:18px; cursor:pointer;">
                    Ghi nhớ đăng nhập trên thiết bị này
                  </label>
                </div>

                <button class="dino-btn green" style="width:100%; margin-top:4px;" onclick="handleLogin()" \${state.isSubmitting ? 'disabled' : ''}>
                  \${state.isSubmitting ? '⏳ Đang Đăng Nhập...' : 'Đăng Nhập ➔'}
                </button>

                <div style="text-align:center; margin-top:14px; font-size:13px; color:#5c7e6c;">
                  Chưa có tài khoản? <a href="javascript:void(0)" onclick="state.authError=''; navigate('signup')" style="color:#239446; font-weight:900; text-decoration:none;">Đăng Ký Ngay</a>
                </div>
              </div>

              <!-- Nút vào nhanh cho bé -->
              <div style="margin-top:12px; padding:0 8px;">
                <button class="dino-outline-btn" style="width:100%; background:#fff; font-size:14px;" onclick="guestLogin()">
                  👶 Dùng Thử Nhanh Cho Bé (Không cần tài khoản) ➔
                </button>
              </div>
            </div>
          \`;
          break;

        case 'signup':
          html = \`
            <div style="text-align:center; padding:20px 0 16px;">
              <div class="brand-title">Dino <em>English</em></div>
              <div class="mascot-box" style="margin:2px 0 6px;">\${getDinoImg('welcome', 'small')}</div>
              
              <div class="dino-card" style="text-align:left;">
                <h3 style="color:#1d703b; margin:0 0 4px; font-size:20px; text-align:center; font-weight:900;">Đăng Ký Tài Khoản</h3>
                <p style="color:#577464; font-size:12px; margin:0 0 12px; text-align:center;">Dành cho phụ huynh để đồng bộ tiến độ học cho bé</p>

                \${state.authError ? \`<div class="error-banner"><span>⚠️</span> \${state.authError}</div>\` : ''}

                <div class="form-group">
                  <label class="form-label">Họ và Tên Phụ Huynh</label>
                  <input id="signupFullName" type="text" class="form-input" placeholder="Ví dụ: Nguyễn Văn A" value="\${state.signupFormData?.fullName || ''}" oninput="state.signupFormData.fullName=this.value">
                </div>

                <div class="form-group">
                  <label class="form-label">Email Phụ Huynh</label>
                  <input id="signupEmail" type="email" class="form-input" placeholder="ba_me@example.com" value="\${state.signupFormData?.email || ''}" oninput="state.signupFormData.email=this.value">
                </div>

                <div class="form-group">
                  <label class="form-label">Mật Khẩu</label>
                  <div class="input-wrapper">
                    <input id="signupPassword" type="\${state.showPassword ? 'text' : 'password'}" class="form-input" placeholder="Tối thiểu 6 ký tự" style="padding-right:42px;" value="\${state.signupFormData?.password || ''}" oninput="state.signupFormData.password=this.value">
                    <button type="button" class="toggle-pwd-btn" onclick="togglePasswordVisibility('password')">
                      \${state.showPassword ? '🙈' : '👁️'}
                    </button>
                  </div>
                </div>

                <div class="form-group">
                  <label class="form-label">Xác Nhận Mật Khẩu</label>
                  <div class="input-wrapper">
                    <input id="signupConfirmPassword" type="\${state.showConfirmPassword ? 'text' : 'password'}" class="form-input" placeholder="Nhập lại mật khẩu" style="padding-right:42px;" value="\${state.signupFormData?.confirmPassword || ''}" oninput="state.signupFormData.confirmPassword=this.value">
                    <button type="button" class="toggle-pwd-btn" onclick="togglePasswordVisibility('confirm')">
                      \${state.showConfirmPassword ? '🙈' : '👁️'}
                    </button>
                  </div>
                </div>

                <div class="terms-checkbox">
                  <input id="signupTerms" type="checkbox" checked style="margin-top:2px; accent-color:#28a44c; width:18px; height:18px; cursor:pointer;">
                  <label for="signupTerms" style="cursor:pointer;">
                    Tôi đồng ý với <b>Điều khoản sử dụng</b> và cam kết bảo vệ quyền riêng tư cho trẻ em.
                  </label>
                </div>

                <button class="dino-btn green" style="width:100%; margin-top:6px;" onclick="handleSignUp()" \${state.isSubmitting ? 'disabled' : ''}>
                  \${state.isSubmitting ? '⏳ Đang Tạo Tài Khoản...' : 'Tạo Tài Khoản 🚀'}
                </button>

                <div style="text-align:center; margin-top:14px; font-size:13px; color:#5c7e6c;">
                  Đã có tài khoản? <a href="javascript:void(0)" onclick="state.authError=''; navigate('login')" style="color:#239446; font-weight:900; text-decoration:none;">Đăng Nhập</a>
                </div>
              </div>
            </div>
          \`;
          break;

        case 'verify_email':
          html = \`
            <div style="text-align:center; padding:24px 0 16px;">
              <div class="mascot-box">\${getDinoImg('happy', 'medium')}</div>
              <div class="dino-card" style="text-align:center;">
                <h2 style="color:#1e7a3d; margin:4px 0 6px; font-size:22px; font-weight:900;">Xác Thực Tài Khoản ✉️</h2>
                <p style="color:#577464; font-size:13px; line-height:1.5; margin:0 0 12px;">
                  Mã xác thực đã được gửi đến email:<br>
                  <b style="color:#1b6334; font-size:14px;">\${state.pendingVerifyEmail || 'email của bạn'}</b>
                </p>

                \${state.authError ? \`<div class="error-banner" style="text-align:left; margin-bottom:12px;"><span>⚠️</span> \${state.authError}</div>\` : ''}
                \${state.authSuccess ? \`<div class="success-banner" style="text-align:left; margin-bottom:12px;"><span>✅</span> \${state.authSuccess}</div>\` : ''}

                <!-- Ô nhập mã xác thực OTP -->
                <div style="margin:16px 0 14px; text-align:center;">
                  <label style="display:block; font-size:13px; font-weight:800; color:#275a3a; margin-bottom:8px;">
                    Nhập mã xác thực (OTP):
                  </label>
                  <input id="otpCodeInput" type="text" inputmode="numeric" maxlength="10"
                    placeholder="• • • • • •"
                    style="width:90%; max-width:280px; font-size:26px; font-weight:900; letter-spacing:6px; text-align:center; padding:10px 12px; border-radius:14px; border:2px solid #34a853; background:#f4fbf5; color:#185a2c; outline:none; font-family:monospace;"
                    onkeyup="if(event.key==='Enter') handleVerifyOtp()">
                </div>

                <div style="background:#f4fbf5; border:1px solid #a8e5be; border-radius:12px; padding:10px 12px; margin-bottom:16px; font-size:12px; color:#3d6550; text-align:left; line-height:1.4;">
                  💡 <b>Mẹo:</b> Kiểm tra hộp thư Đến hoặc mục <b>Spam / Thư rác</b> để lấy mã xác thực hoặc nhấn trực tiếp vào nút kích hoạt trong email.
                </div>

                <button class="dino-btn green" style="width:100%; margin-bottom:10px; font-size:16px;" onclick="handleVerifyOtp()" \${state.isSubmitting ? 'disabled' : ''}>
                  \${state.isSubmitting ? '⏳ Đang Xác Thực...' : 'Xác Thực Tài Khoản ➔'}
                </button>

                <div style="display:flex; gap:8px;">
                  <button class="dino-outline-btn" style="flex:1; font-size:13px; padding:10px;" onclick="handleResendVerification()">
                    Gửi Lại Mã 🔄
                  </button>
                  <button class="dino-outline-btn" style="flex:1; font-size:13px; padding:10px;" onclick="state.authError=''; state.authSuccess=''; navigate('login')">
                    Về Đăng Nhập
                  </button>
                </div>
              </div>
            </div>
          \`;
          break;

        case 'forgot_password':
          html = \`
            <div style="text-align:center; padding:30px 0 16px;">
              <div class="mascot-box">\${getDinoImg('study', 'medium')}</div>
              <div class="dino-card" style="text-align:left;">
                <h3 style="color:#1d703b; margin:0 0 6px; font-size:20px; text-align:center; font-weight:900;">Khôi Phục Mật Khẩu 🔑</h3>
                <p style="color:#577464; font-size:13px; margin:0 0 14px; text-align:center;">Nhập email phụ huynh để nhận liên kết đặt lại mật khẩu mới</p>

                \${state.authError ? \`<div class="error-banner"><span>⚠️</span> \${state.authError}</div>\` : ''}
                \${state.authSuccess ? \`<div class="success-banner"><span>✅</span> \${state.authSuccess}</div>\` : ''}

                <div class="form-group">
                  <label class="form-label">Email Của Bạn</label>
                  <input id="forgotEmail" type="email" class="form-input" placeholder="ba_me@example.com">
                </div>

                <button class="dino-btn green" style="width:100%; margin-top:8px;" onclick="handleForgotPassword()" \${state.isSubmitting ? 'disabled' : ''}>
                  \${state.isSubmitting ? '⏳ Đang Gửi...' : 'Gửi Liên Kết Khôi Phục ➔'}
                </button>

                <div style="text-align:center; margin-top:14px; font-size:13px;">
                  <a href="javascript:void(0)" onclick="state.authError=''; navigate('login')" style="color:#239446; font-weight:900; text-decoration:none;">Quay Lại Đăng Nhập</a>
                </div>
              </div>
            </div>
          \`;
          break;

        case 'reset_password':
          html = \`
            <div style="text-align:center; padding:30px 0 16px;">
              <div class="mascot-box">\${getDinoImg('study', 'medium')}</div>
              <div class="dino-card" style="text-align:left;">
                <h3 style="color:#1d703b; margin:0 0 6px; font-size:20px; text-align:center; font-weight:900;">Đặt Lại Mật Khẩu Mới 🔒</h3>
                <p style="color:#577464; font-size:13px; margin:0 0 14px; text-align:center;">Vui lòng nhập mật khẩu mới cho tài khoản phụ huynh</p>

                \${state.authError ? \`<div class="error-banner"><span>⚠️</span> \${state.authError}</div>\` : ''}
                \${state.authSuccess ? \`<div class="success-banner"><span>✅</span> \${state.authSuccess}</div>\` : ''}

                <div class="form-group">
                  <label class="form-label">Mật Khẩu Mới</label>
                  <input id="resetPassword" type="password" class="form-input" placeholder="Tối thiểu 6 ký tự">
                </div>

                <div class="form-group">
                  <label class="form-label">Xác Nhận Mật Khẩu Mới</label>
                  <input id="resetConfirmPassword" type="password" class="form-input" placeholder="Nhập lại mật khẩu mới">
                </div>

                <button class="dino-btn green" style="width:100%; margin-top:8px;" onclick="handleResetPassword()" \${state.isSubmitting ? 'disabled' : ''}>
                  \${state.isSubmitting ? '⏳ Đang Cập Nhật...' : 'Cập Nhật Mật Khẩu ➔'}
                </button>
              </div>
            </div>
          \`;
          break;

        case 'child_setup':
          html = \`
            <div style="text-align:center; padding:20px 0 16px;">
              <div class="brand-title">Dino <em>English</em></div>
              <div class="mascot-box" style="margin:2px 0 6px;">\${getDinoImg(state.selectedAvatar || 'welcome', 'small')}</div>
              
              <div class="dino-card" style="text-align:left;">
                <h3 style="color:#1d703b; margin:0 0 4px; font-size:20px; text-align:center; font-weight:900;">Tạo Hồ Sơ Cho Bé 👶</h3>
                <p style="color:#577464; font-size:12px; margin:0 0 12px; text-align:center;">Thiết lập hồ sơ để Dino đồng hành và theo dõi học tập cho con</p>

                \${state.authError ? \`<div class="error-banner"><span>⚠️</span> \${state.authError}</div>\` : ''}

                <div class="form-group">
                  <label class="form-label">Tên Thân Mật Của Bé</label>
                  <input id="setupChildName" type="text" class="form-input" placeholder="Ví dụ: Bé Na, Bon, Bi, Bắp..." value="\${state.kidName || ''}">
                </div>

                <div class="form-group">
                  <label class="form-label">Nhóm Tuổi</label>
                  <div class="chip-group">
                    <button type="button" class="chip-btn \${state.selectedAgeGroup === '3-5' ? 'active' : ''}" onclick="state.selectedAgeGroup='3-5'; render();">3–5 tuổi</button>
                    <button type="button" class="chip-btn \${state.selectedAgeGroup === '6-8' ? 'active' : ''}" onclick="state.selectedAgeGroup='6-8'; render();">6–8 tuổi</button>
                    <button type="button" class="chip-btn \${state.selectedAgeGroup === '9-12' ? 'active' : ''}" onclick="state.selectedAgeGroup='9-12'; render();">9–12 tuổi</button>
                  </div>
                </div>

                <div class="form-group">
                  <label class="form-label">Chọn Linh Vật Dino Đại Diện</label>
                  <div class="avatar-grid">
                    \${['welcome', 'study', 'game', 'level3'].map(av => \`
                      <div class="avatar-choice \${state.selectedAvatar === av ? 'active' : ''}" onclick="state.selectedAvatar='\${av}'; render();">
                        <img src="\${DINO_ASSETS[av]}" style="width:46px; height:46px; object-fit:contain;">
                      </div>
                    \`).join('')}
                  </div>
                </div>

                <div class="form-group">
                  <label class="form-label">Cấp Độ Tiếng Anh Ban Đầu</label>
                  <div class="chip-group">
                    <button type="button" class="chip-btn \${state.selectedLevel === 'beginner' ? 'active' : ''}" onclick="state.selectedLevel='beginner'; render();">Mới Bắt Đầu</button>
                    <button type="button" class="chip-btn \${state.selectedLevel === 'intermediate' ? 'active' : ''}" onclick="state.selectedLevel='intermediate'; render();">Đã Biết Cơ Bản</button>
                  </div>
                </div>

                <button class="dino-btn green" style="width:100%; margin-top:8px;" onclick="handleCreateChild()" \${state.isSubmitting ? 'disabled' : ''}>
                  \${state.isSubmitting ? '⏳ Đang Lưu...' : 'Bắt Đầu Học Ngay 🚀'}
                </button>
              </div>
            </div>
          \`;
          break;

        case 'parent_dashboard':
          const totalCompleted = state.completedLessons.length;
          const totalWordsLearned = totalCompleted * 10;
          const estMinutes = Math.round(totalCompleted * 6);
          const currentEvo = getEvolutionMilestone();

          html = \`
            <div class="top-header" style="display:flex; justify-content:space-between; align-items:center;">
              <button class="dino-outline-btn" style="padding:6px 12px; font-size:13px; width:auto;" onclick="navigate('profile')">❮ Quay Lại</button>
              <h2 style="margin:0; font-size:18px; font-weight:900; color:#1e6a39;">Khu Vực Phụ Huynh 👨‍👩‍👧</h2>
              <span class="badge-star">⭐ \${state.stars}</span>
            </div>

            <!-- CHỌN / QUẢN LÝ HỒ SƠ BÉ -->
            <div class="dino-card" style="margin-bottom:12px;">
              <div style="display:flex; justify-content:space-between; align-items:center; margin-bottom:8px;">
                <b style="color:#1d703b; font-size:15px;">Hồ Sơ Các Bé Của Bạn:</b>
                <button class="dino-outline-btn" style="padding:4px 8px; font-size:12px; width:auto; border-color:#84d89a; color:#1e7a3d;" onclick="navigate('child_setup')">+ Thêm Bé</button>
              </div>

              \${state.children && state.children.length > 0 ? \`
                <div style="display:flex; flex-direction:column; gap:8px;">
                  \${state.children.map(k => {
                    const isSelected = k.id === state.activeChildId;
                    return \`
                      <div style="display:flex; justify-content:space-between; align-items:center; background:\${isSelected ? '#eafbee' : '#f9fbf9'}; border:2px solid \${isSelected ? '#28a44c' : '#d5e6da'}; border-radius:14px; padding:8px 12px;">
                        <div style="display:flex; align-items:center; gap:10px; cursor:pointer;" onclick="handleSwitchChild('\${k.id}')">
                          <img src="\${DINO_ASSETS[k.avatar_url || 'welcome'] || DINO_ASSETS['welcome']}" style="width:36px; height:36px; object-fit:contain;">
                          <div>
                            <div style="font-weight:900; font-size:15px; color:\${isSelected ? '#1e7a3d' : '#335541'};">\${k.display_name} \${isSelected ? '🌟 (Đang học)' : ''}</div>
                            <div style="font-size:11px; color:#5c7e6c;">Nhóm tuổi: \${k.age_group || '6-8'} · \${k.current_level || 'Cơ bản'}</div>
                          </div>
                        </div>
                        <div style="display:flex; gap:6px;">
                          \${!isSelected ? \`<button class="dino-btn green" style="padding:4px 8px; font-size:11px; width:auto;" onclick="handleSwitchChild('\${k.id}')">Chọn</button>\` : ''}
                          \${state.children.length > 1 ? \`<button class="dino-outline-btn" style="padding:4px 8px; font-size:11px; width:auto; color:#d42638; border-color:#f5b0b8;" onclick="handleDeleteChild('\${k.id}', '\${k.display_name}')">Xóa</button>\` : ''}
                        </div>
                      </div>
                    \`;
                  }).join('')}
                </div>
              \` : \`
                <div style="font-size:13px; color:#557763; margin-bottom:8px;">Đang sử dụng hồ sơ cục bộ: <b>\${state.kidName}</b></div>
              \`}
            </div>

            <!-- THỐNG KÊ TỔNG QUAN -->
            <div style="display:grid; grid-template-columns:1fr 1fr; gap:8px; margin-bottom:12px;">
              <div class="stat-card">
                <div style="font-size:20px;">📖</div>
                <div style="font-size:20px; font-weight:900; color:#1e7a3d;">\${totalCompleted} / 120</div>
                <div style="font-size:11px; font-weight:800; color:#5c7e6c;">Bài học hoàn thành</div>
              </div>
              <div class="stat-card">
                <div style="font-size:20px;">💡</div>
                <div style="font-size:20px; font-weight:900; color:#1d7cd6;">\${totalWordsLearned}</div>
                <div style="font-size:11px; font-weight:800; color:#5c7e6c;">Từ vựng đã học</div>
              </div>
              <div class="stat-card">
                <div style="font-size:20px;">⏱️</div>
                <div style="font-size:20px; font-weight:900; color:#e05424;">\${estMinutes} phút</div>
                <div style="font-size:11px; font-weight:800; color:#5c7e6c;">Thời gian học tập</div>
              </div>
              <div class="stat-card">
                <div style="font-size:20px;">⭐</div>
                <div style="font-size:20px; font-weight:900; color:#d48a0d;">\${state.stars} sao</div>
                <div style="font-size:11px; font-weight:800; color:#5c7e6c;">Cột mốc Cấp \${currentEvo.level}</div>
              </div>
            </div>

            <!-- TIẾN ĐỘ 12 CHỦ ĐỀ HỌC TẬP -->
            <div class="dino-card" style="margin-bottom:12px;">
              <b style="color:#1d703b; font-size:15px; display:block; margin-bottom:10px;">Tiến Độ 12 Chủ Đề:</b>
              <div style="display:flex; flex-direction:column; gap:8px;">
                \${DINO_DB.topics.map(t => {
                  const compInTopic = state.completedLessons.filter(l => l.startsWith(t.id + '_l')).length;
                  const pct = Math.round((compInTopic / 10) * 100);
                  return \`
                    <div>
                      <div style="display:flex; justify-content:space-between; font-size:12px; margin-bottom:3px; font-weight:800;">
                        <span>\${getTopicEmoji(t.id)} \${t.nameVi}</span>
                        <span style="color:#239446;">\${compInTopic}/10 bài (\${pct}%)</span>
                      </div>
                      <div class="progress-bar" style="height:8px; margin:0;"><div class="progress-fill" style="width:\${pct}%;"></div></div>
                    </div>
                  \`;
                }).join('')}
              </div>
            </div>

            <!-- QUẢN LÝ TÀI KHOẢN & BẢO MẬT -->
            <div class="dino-card">
              <b style="color:#1d703b; font-size:15px; display:block; margin-bottom:8px;">Tài Khoản Phụ Huynh:</b>
              <div style="font-size:13px; color:#496d58; margin-bottom:10px;">
                Email: <b>\${state.supabaseUser ? state.supabaseUser.email : 'Chưa đăng nhập'}</b>
              </div>
              <div style="display:flex; gap:8px; margin-bottom:12px;">
                <button class="dino-outline-btn" style="flex:1; font-size:12px; padding:8px;" onclick="handleCloudLogout()">Đăng Xuất</button>
                <button class="dino-outline-btn" style="flex:1; font-size:12px; padding:8px; color:#d42638; border-color:#f5b0b8;" onclick="handleDeleteAccount()">Xóa Tài Khoản</button>
              </div>
              <p style="font-size:11px; color:#849f90; margin:0; line-height:1.4;">
                🛡️ Cam kết bảo mật: Dino English không thu thập bất kỳ thông tin nhận dạng cá nhân nào của trẻ em.
              </p>
            </div>
          \`;
          break;

        case 'home':
          const currentTopic = getTopic(state.currentTopicId);
          const currentLesson = getLesson(state.currentTopicId, state.currentLessonId);
          const lvl = getEvolutionLevel();
          html = \`
            <!-- Header trang chủ: Avatar bé, Lời chào, Quà tặng & Cài đặt -->
            <div style="display:flex; align-items:center; justify-content:space-between; padding:12px 0 6px;">
              <div style="display:flex; align-items:center; gap:10px;">
                <!-- Avatar tròn của bé với huy hiệu sao -->
                <div style="position:relative; width:52px; height:52px; flex-shrink:0; cursor:pointer;" onclick="navigate('profile')">
                  <div style="width:52px; height:52px; border-radius:50%; border:3px solid #fff; box-shadow:0 4px 10px rgba(35,148,70,0.18); overflow:hidden; background:linear-gradient(135deg, #dcfce7, #bbf7d0); display:flex; align-items:center; justify-content:center;">
                    \${getDinoImg(state.selectedAvatar || 'welcome', '')}
                  </div>
                  <div style="position:absolute; bottom:-1px; right:-2px; background:#ffd233; color:#7a4f00; font-size:10px; font-weight:900; width:18px; height:18px; border-radius:50%; display:flex; align-items:center; justify-content:center; border:2px solid #fff; box-shadow:0 2px 4px rgba(0,0,0,0.15);">⭐</div>
                </div>

                <div>
                  <span style="font-size:13px; color:#3d634d; font-weight:800; line-height:1.1; display:block;">Xin chào,</span>
                  <div style="font-size:22px; font-weight:900; color:#24a148; line-height:1.2; text-shadow:0 1px 0 #fff;">\${(!state.kidName || state.kidName.includes('Ã')) ? 'Bé Na' : state.kidName}!</div>
                </div>
              </div>

              <!-- 2 Nút tròn: Quà tặng 🎁 & Cài đặt ⚙️ -->
              <div style="display:flex; align-items:center; gap:8px;">
                <button class="header-circle-btn" onclick="openDailyGift()" title="Quà tặng hàng ngày" style="width:40px; height:40px; border-radius:50%; background:#fff; border:1.5px solid #eef5f0; box-shadow:0 3px 8px rgba(0,0,0,0.08); font-size:18px; display:flex; align-items:center; justify-content:center; cursor:pointer; transition:transform 0.15s; outline:none;">
                  🎁
                </button>
                <button class="header-circle-btn" onclick="navigate('profile')" title="Cài đặt" style="width:40px; height:40px; border-radius:50%; background:#fff; border:1.5px solid #eef5f0; box-shadow:0 3px 8px rgba(0,0,0,0.08); font-size:18px; display:flex; align-items:center; justify-content:center; cursor:pointer; transition:transform 0.15s; outline:none;">
                  ⚙️
                </button>
              </div>
            </div>

            <!-- Khung thống kê học tập (Chuỗi ngày - Hôm nay - Sao) -->
            <div style="background:rgba(255,255,255,0.96); backdrop-filter:blur(8px); -webkit-backdrop-filter:blur(8px); border-radius:20px; border:1.5px solid #fff; box-shadow:0 4px 14px rgba(25, 80, 45, 0.08); padding:10px 14px; margin-top:6px; margin-bottom:12px; display:flex; align-items:center; justify-content:space-between; gap:10px;">
              <!-- 1. Chuỗi ngày học -->
              <div style="display:flex; align-items:center; gap:6px; min-width:88px;">
                <span style="font-size:24px; line-height:1;">🔥</span>
                <div>
                  <div style="font-size:10px; font-weight:800; color:#ff5722; text-transform:none; line-height:1;">Chuỗi ngày học</div>
                  <div style="margin-top:2px; line-height:1.1;">
                    <b style="font-size:18px; font-weight:900; color:#e64a19;">\${state.streak || 3}</b>
                    <span style="font-size:11px; font-weight:700; color:#687b70;">ngày liên tiếp</span>
                  </div>
                </div>
              </div>

              <!-- Vạch ngăn cách dọc -->
              <div style="width:1px; height:32px; background:#edf4ef;"></div>

              <!-- 2. Tiến độ hôm nay (Segmented Bar 5 vạch) -->
              <div style="flex:1; min-width:0; padding:0 2px;">
                <div style="font-size:12px; font-weight:800; color:#2c4f3a; margin-bottom:5px;">
                  Hôm nay: <b style="color:#239446; font-weight:900;">3/5</b> bài
                </div>
                <!-- 5 Vạch tiến độ bo góc -->
                <div style="display:flex; gap:4px; height:8px;">
                  <div style="flex:1; background:#28a745; border-radius:5px;"></div>
                  <div style="flex:1; background:#28a745; border-radius:5px;"></div>
                  <div style="flex:1; background:#28a745; border-radius:5px;"></div>
                  <div style="flex:1; background:#e2ede6; border-radius:5px;"></div>
                  <div style="flex:1; background:#e2ede6; border-radius:5px;"></div>
                </div>
              </div>

              <!-- Vạch ngăn cách dọc -->
              <div style="width:1px; height:32px; background:#edf4ef;"></div>

              <!-- 3. Số sao tích lũy -->
              <div style="background:#fff9e6; border:1px solid #ffe8a3; border-radius:14px; padding:6px 10px; display:flex; flex-direction:column; align-items:center; justify-content:center; min-width:44px;">
                <span style="font-size:18px; line-height:1; filter:drop-shadow(0 2px 4px rgba(245,158,11,0.3));">⭐</span>
                <b style="font-size:14px; font-weight:900; color:#855400; margin-top:2px;">\${state.stars || 15}</b>
              </div>
            </div>

            <!-- Thẻ "Tiếp tục học / Học ngay" chuẩn giao diện hình ảnh -->
            <div class="dino-card" style="position:relative; overflow:hidden; border:2.5px solid #8fe0a2; box-shadow:0 6px 18px rgba(35,148,70,0.18); border-radius:24px; padding:16px; margin:0 0 16px; display:flex; align-items:center; justify-content:space-between; flex-shrink:0; min-height:165px; box-sizing:border-box; background:${bannerHocNgayDataUrl ? `url('${bannerHocNgayDataUrl}') center / cover no-repeat,` : ''} #eafae8;">
              <div style="position:relative; z-index:2; max-width:62%; display:flex; flex-direction:column; justify-content:center;">
                <div style="display:flex; align-items:center; gap:6px; margin-bottom:6px;">
                  <span style="background:#28a745; color:#fff; font-size:10px; font-weight:900; padding:3px 8px; border-radius:10px; box-shadow:0 2px 4px rgba(40,167,69,0.3); line-height:1.2;">Tiếp tục học</span>
                  <span style="background:#8b5cf6; color:#fff; font-size:10px; font-weight:900; padding:3px 8px; border-radius:10px; box-shadow:0 2px 4px rgba(139,92,246,0.3); line-height:1.2;">⭐ Bài \${currentLesson.lessonId}/8</span>
                </div>
                <h3 style="margin:2px 0; font-size:19px; font-weight:900; color:#145226; text-shadow:0 1px 3px rgba(255,255,255,0.9); line-height:1.25;">Unit \${currentLesson.lessonId}: \${currentTopic.nameEn || currentLesson.title}</h3>
                <p style="margin:0 0 6px; font-size:13px; font-weight:700; color:#236138; text-shadow:0 1px 2px rgba(255,255,255,0.9); line-height:1.2;">\${currentLesson.title}</p>
                <button class="dino-btn" style="margin-top:4px; margin-bottom:0; background:linear-gradient(180deg, #ffae11, #f59e0b); color:#fff; padding:7px 18px; font-size:14px; width:auto; align-self:flex-start; box-shadow:0 3px 0 #d48a0d; font-weight:900; border-radius:20px; line-height:1.2;" onclick="navigate('activity_hub', {topicId:'\${currentTopic.id}', lessonId:\${currentLesson.lessonId}})">Học ngay ▶</button>
              </div>
              <div style="position:relative; z-index:2; flex-shrink:0; display:flex; align-items:center; justify-content:center; width:110px;">
                \${getDinoImg('welcome', 'small')}
              </div>
            </div>

            <h3 style="margin:16px 0 10px; color:#1e6a39; font-size:18px;">Bé muốn học gì hôm nay?</h3>
            <div class="grid-2">
              <div class="tile-card" style="border-color:#b9e7c5;" onclick="navigate('vocab', {topicId:'\${currentTopic.id}', lessonId:\${currentLesson.lessonId}})">
                <div style="font-size:28px;">📖</div>
                <b style="color:#239446; font-size:16px;">Từ vựng</b>
                <div style="font-size:12px; color:#688776;">10 Thẻ 3D & IPA</div>
              </div>
              <div class="tile-card" style="border-color:#b5d9ff;" onclick="navigate('pron', {topicId:'\${currentTopic.id}', lessonId:\${currentLesson.lessonId}})">
                <div style="font-size:28px;">🎤</div>
                <b style="color:#1d7cd6; font-size:16px;">Phát âm</b>
                <div style="font-size:12px; color:#688776;">Nghe & Luyện nói</div>
              </div>
              <div class="tile-card" style="border-color:#dcc6ff;" onclick="navigate('game', {topicId:'\${currentTopic.id}', lessonId:\${currentLesson.lessonId}})">
                <div style="font-size:28px;">🎮</div>
                <b style="color:#7837d9; font-size:16px;">Trò chơi</b>
                <div style="font-size:12px; color:#688776;">Đố vui phản xạ</div>
              </div>
              <div class="tile-card" style="border-color:#ffccd2;" onclick="navigate('song', {topicId:'\${currentTopic.id}'})">
                <div style="font-size:28px;">🎵</div>
                <b style="color:#df3447; font-size:16px;">Bài hát</b>
                <div style="font-size:12px; color:#688776;">Giai điệu vui nhộn</div>
              </div>
            </div>

            <h3 style="margin:18px 0 8px; color:#1e6a39; font-size:18px;">Dino lớn lên cùng bé</h3>
            <div class="dino-card" style="display:flex; gap:14px; align-items:center;" onclick="navigate('growth')">
              \${getDinoImg(getMilestoneMascot(), 'tiny')}
              <div style="flex:1;">
                <span style="background:#28a44c; color:#fff; font-size:10px; font-weight:900; padding:2px 8px; border-radius:10px;">CẤP \${lvl} / 20</span>
                <div style="font-size:15px; font-weight:900; color:#18592d; margin:4px 0;">Dino Trưởng Thành</div>
                <div class="progress-bar"><div class="progress-fill" style="width:\${Math.min(100, lvl*5)}%;"></div></div>
                <div style="font-size:11px; color:#6b8b79;">\${state.completedLessons.length} bài học đã xong ➔</div>
              </div>
            </div>
          \`;
          break;

        case 'topics':
          html = \`
            <div class="top-header">
              <h2 style="margin:0; font-size:20px; font-weight:900; color:#1e6a39;">12 Chủ Đề Tiếng Anh</h2>
              <span class="badge-star">⭐ \${state.stars}</span>
            </div>
            <p style="margin:0 0 12px; font-size:13px; color:#5b7c6b;">Mỗi chủ đề gồm 10 bài học x 10 từ = 100 từ vựng:</p>
            <div class="grid-2">
              \${DINO_DB.topics.map(t => {
                const doneCount = t.lessons.filter(l => state.completedLessons.includes(\`\${t.id}_l\${l.lessonId}\`)).length;
                const pct = Math.round((doneCount / t.lessons.length) * 100);
                return \`
                  <div class="tile-card" style="border-color:\${t.colorHex}55;" onclick="navigate('lessons', {topicId:'\${t.id}'})">
                    <div style="display:flex; justify-content:space-between; align-items:center;">
                      <span style="font-size:24px;">\${getTopicEmoji(t.id)}</span>
                      <span style="font-size:11px; font-weight:900; color:\${t.colorHex}; background:\${t.colorHex}22; padding:2px 6px; border-radius:10px;">\${pct}%</span>
                    </div>
                    <b style="display:block; font-size:16px; margin:6px 0 2px; color:#1b4a2e;">\${t.nameVi}</b>
                    <span style="font-size:12px; color:#688877;">\${t.nameEn}</span>
                    <div class="progress-bar"><div class="progress-fill" style="width:\${pct}%; background:\${t.colorHex};"></div></div>
                    <span style="font-size:11px; color:#789987;">\${doneCount}/10 bài học</span>
                  </div>
                \`;
              }).join('')}
            </div>
          \`;
          break;

        case 'lessons':
          const t = getTopic(state.currentTopicId);
          html = \`
            <div class="top-header">
              <button class="back-btn" onclick="navigate('topics')">←</button>
              <h2 style="margin:0; font-size:20px; color:\${t.colorHex};">\${t.nameVi}</h2>
              <span class="badge-star">⭐ \${state.stars}</span>
            </div>
            <div class="dino-card" style="background:\${t.colorHex}15; border-color:\${t.colorHex}44; margin-top:4px;">
              <h3 style="margin:0 0 4px; color:\${t.colorHex}; font-size:18px;">\${t.nameVi} (\${t.nameEn})</h3>
              <p style="margin:0; font-size:13px; color:#5b7c6b;">\${t.description}</p>
            </div>
            <h4 style="margin:14px 0 8px; color:#1e6a39;">10 Bài Học Trong Chủ Đề:</h4>
            \${t.lessons.map(l => {
              const isUnlocked = l.lessonId === 1 || state.completedLessons.includes(\`\${t.id}_l\${l.lessonId-1}\`);
              const isDone = state.completedLessons.includes(\`\${t.id}_l\${l.lessonId}\`);
              return \`
                <div class="tile-card" style="margin-bottom:10px; display:flex; justify-content:space-between; align-items:center; opacity:\${isUnlocked?1:0.6};" onclick="\${isUnlocked ? \`navigate('activity_hub', {topicId:'\${t.id}', lessonId:\${l.lessonId}})\` : ''}">
                  <div>
                    <span style="background:\${isDone?'#30a953':t.colorHex}; color:#fff; font-size:11px; font-weight:900; padding:2px 8px; border-radius:10px;">BÀI \${l.lessonId}</span>
                    <b style="display:block; font-size:16px; margin:4px 0 2px; color:#1b4a2e;">\${l.title}</b>
                    <span style="font-size:12px; color:#688877;">10 từ vựng · \${isDone?'⭐⭐⭐ Đã hoàn thành':'Chưa hoàn thành'}</span>
                  </div>
                  <span style="font-size:20px;">\${!isUnlocked ? '🔒' : isDone ? '✅' : '➔'}</span>
                </div>
              \`;
            }).join('')}
          \`;
          break;

        case 'activity_hub': {
          const hubTopic = getTopic(state.currentTopicId);
          const hubLesson = getLesson(state.currentTopicId, state.currentLessonId);

          const vocabKey = \`\${hubTopic.id}_l\${hubLesson.lessonId}_vocab\`;
          const pronKey = \`\${hubTopic.id}_l\${hubLesson.lessonId}_pron\`;
          const gameKey = \`\${hubTopic.id}_l\${hubLesson.lessonId}_game\`;
          const songKey = \`\${hubTopic.id}_l\${hubLesson.lessonId}_song\`;

          const isVocabDone = state.completedActivities.includes(vocabKey);
          const isPronDone = state.completedActivities.includes(pronKey);
          const isGameDone = state.completedActivities.includes(gameKey);
          const isSongDone = state.completedActivities.includes(songKey) ||
                             state.completedActivities.includes(\`\${hubTopic.id}_song\`) ||
                             state.completedActivities.includes(\`\${hubTopic.id}_l1_song\`);

          const hubCompletedCount = (isVocabDone ? 1 : 0) + (isPronDone ? 1 : 0) + (isGameDone ? 1 : 0) + (isSongDone ? 1 : 0);
          const hubProgressPercent = Math.round((hubCompletedCount / 4) * 100);

          html = \`
            <div class="top-header">
              <button class="back-btn" onclick="navigate('lessons', {topicId:'\${hubTopic.id}'})">←</button>
              <h2 style="margin:0; font-size:18px; color:#1e6a39;">Bài \${hubLesson.lessonId}: \${hubLesson.title}</h2>
              <span class="badge-star">⭐ \${state.stars}</span>
            </div>

            <!-- Thẻ tiến độ tổng quan bài học -->
            <div class="dino-card" style="text-align:center; padding:14px 14px 12px; margin-bottom:12px;">
              <div style="display:flex; justify-content:center; margin-bottom:4px;">
                \${getDinoImg(hubCompletedCount === 4 ? 'level4' : (hubCompletedCount > 0 ? 'study' : 'welcome'), 'small')}
              </div>
              <h3 style="color:#239446; margin:4px 0 2px; font-size:18px; font-weight:900;">\${hubTopic.nameVi} · Bài \${hubLesson.lessonId}</h3>
              
              <div style="display:flex; justify-content:space-between; align-items:center; margin:8px 0 4px; font-size:13px; font-weight:800; color:#325c43;">
                <span>Tiến độ bài học:</span>
                <span style="color:\${hubCompletedCount === 4 ? '#198754' : '#239446'}; font-weight:900;">
                  \${hubCompletedCount}/4 phần (\${hubProgressPercent}%) \${hubCompletedCount === 4 ? '🎉' : ''}
                </span>
              </div>
              
              <div class="progress-bar" style="height:10px; margin:0 0 6px; background:#e2ede5; border-radius:12px; overflow:hidden;">
                <div class="progress-fill" style="width:\${hubProgressPercent}%; background:linear-gradient(90deg, #34d399, #10b981); height:100%; transition:width 0.3s ease;"></div>
              </div>

              <p style="color:#638372; font-size:12px; margin:0;">
                \${hubCompletedCount === 4 
                  ? '🌟 Bé đã hoàn thành xuất sắc tất cả 4 hoạt động! Có thể học lại bất cứ lúc nào.' 
                  : 'Chọn hoạt động để học, hoàn thành sẽ xuất hiện dấu tích xanh:'}
              </p>
            </div>

            <!-- 4 Thẻ hoạt động kèm dấu tích xanh khi hoàn thành -->
            <div style="display:flex; flex-direction:column; gap:10px;">
              <!-- 1. Từ Vựng (Flashcards) -->
              <div class="tile-card" style="border-color:\${isVocabDone ? '#28a745' : '#30a953'}; background:\${isVocabDone ? '#f4fbf6' : '#fff'}; display:flex; align-items:center; justify-content:space-between; gap:12px;" onclick="navigate('vocab', {topicId:'\${hubTopic.id}', lessonId:\${hubLesson.lessonId}})">
                <div style="flex:1;">
                  <b style="color:\${isVocabDone ? '#1e7a3d' : '#28a44c'}; font-size:16px;">📖 1. Học Từ Vựng (Flashcards)</b>
                  <p style="margin:4px 0 0; font-size:13px; color:#688877;">10 Thẻ minh họa, phát âm và phiên âm IPA (+5 ⭐)</p>
                </div>
                <div>
                  \${isVocabDone 
                    ? \`<div style="width:34px; height:34px; border-radius:50%; background:#28a745; color:#fff; display:flex; align-items:center; justify-content:center; font-weight:900; font-size:19px; box-shadow:0 3px 6px rgba(40,167,69,0.35); flex-shrink:0;">✓</div>\`
                    : \`<div style="width:34px; height:34px; border-radius:50%; background:#f0f5f2; color:#557763; display:flex; align-items:center; justify-content:center; font-weight:800; font-size:14px; flex-shrink:0;">➔</div>\`
                  }
                </div>
              </div>

              <!-- 2. Luyện Phát Âm (Nghe & Nói) -->
              <div class="tile-card" style="border-color:\${isPronDone ? '#28a745' : '#2a82e4'}; background:\${isPronDone ? '#f4fbf6' : '#fff'}; display:flex; align-items:center; justify-content:space-between; gap:12px;" onclick="navigate('pron', {topicId:'\${hubTopic.id}', lessonId:\${hubLesson.lessonId}})">
                <div style="flex:1;">
                  <b style="color:\${isPronDone ? '#1e7a3d' : '#207ee8'}; font-size:16px;">🎤 2. Luyện Phát Âm (Nghe & Nói)</b>
                  <p style="margin:4px 0 0; font-size:13px; color:#688877;">Tập phát âm qua micro theo mẫu giọng chuẩn (+5 ⭐)</p>
                </div>
                <div>
                  \${isPronDone 
                    ? \`<div style="width:34px; height:34px; border-radius:50%; background:#28a745; color:#fff; display:flex; align-items:center; justify-content:center; font-weight:900; font-size:19px; box-shadow:0 3px 6px rgba(40,167,69,0.35); flex-shrink:0;">✓</div>\`
                    : \`<div style="width:34px; height:34px; border-radius:50%; background:#f0f5f2; color:#557763; display:flex; align-items:center; justify-content:center; font-weight:800; font-size:14px; flex-shrink:0;">➔</div>\`
                  }
                </div>
              </div>

              <!-- 3. Trò Chơi Đố Vui 3D -->
              <div class="tile-card" style="border-color:\${isGameDone ? '#28a745' : '#8e44ec'}; background:\${isGameDone ? '#f4fbf6' : '#fff'}; display:flex; align-items:center; justify-content:space-between; gap:12px;" onclick="navigate('game', {topicId:'\${hubTopic.id}', lessonId:\${hubLesson.lessonId}})">
                <div style="flex:1;">
                  <b style="color:\${isGameDone ? '#1e7a3d' : '#8a3de8'}; font-size:16px;">🎮 3. Trò Chơi Đố Vui 3D</b>
                  <p style="margin:4px 0 0; font-size:13px; color:#688877;">Chọn đúng nghĩa của các từ trong bài (+10 ⭐)</p>
                </div>
                <div>
                  \${isGameDone 
                    ? \`<div style="width:34px; height:34px; border-radius:50%; background:#28a745; color:#fff; display:flex; align-items:center; justify-content:center; font-weight:900; font-size:19px; box-shadow:0 3px 6px rgba(40,167,69,0.35); flex-shrink:0;">✓</div>\`
                    : \`<div style="width:34px; height:34px; border-radius:50%; background:#f0f5f2; color:#557763; display:flex; align-items:center; justify-content:center; font-weight:800; font-size:14px; flex-shrink:0;">➔</div>\`
                  }
                </div>
              </div>

              <!-- 4. Bài Hát Theo Chủ Đề -->
              <div class="tile-card" style="border-color:\${isSongDone ? '#28a745' : '#eb4b5d'}; background:\${isSongDone ? '#f4fbf6' : '#fff'}; display:flex; align-items:center; justify-content:space-between; gap:12px;" onclick="navigate('song', {topicId:'\${hubTopic.id}', lessonId:\${hubLesson.lessonId}})">
                <div style="flex:1;">
                  <b style="color:\${isSongDone ? '#1e7a3d' : '#e03447'}; font-size:16px;">🎵 4. Bài Hát Theo Chủ Đề</b>
                  <p style="margin:4px 0 0; font-size:13px; color:#688877;">Hát từng câu theo giai điệu vui vẻ (+5 ⭐)</p>
                </div>
                <div>
                  \${isSongDone 
                    ? \`<div style="width:34px; height:34px; border-radius:50%; background:#28a745; color:#fff; display:flex; align-items:center; justify-content:center; font-weight:900; font-size:19px; box-shadow:0 3px 6px rgba(40,167,69,0.35); flex-shrink:0;">✓</div>\`
                    : \`<div style="width:34px; height:34px; border-radius:50%; background:#f0f5f2; color:#557763; display:flex; align-items:center; justify-content:center; font-weight:800; font-size:14px; flex-shrink:0;">➔</div>\`
                  }
                </div>
              </div>
            </div>
          \`;
          break;
        }

        case 'vocab':
          const vLesson = getLesson(state.currentTopicId, state.currentLessonId);
          const vWord = vLesson.words[state.cardIndex];
          html = \`
            <div class="top-header">
              <button class="back-btn" onclick="navigate('activity_hub')">←</button>
              <span style="font-weight:900; color:#1e6a39;">Từ \${state.cardIndex + 1} / \${vLesson.words.length}</span>
              <span class="badge-star">⭐ \${state.stars}</span>
            </div>
            <div class="progress-bar"><div class="progress-fill" style="width:\${((state.cardIndex+1)/vLesson.words.length)*100}%;"></div></div>
            <div class="dino-card flashcard">
              <div class="word-illustration-badge">
                <span class="word-emoji">\${vWord.emoji || '🌟'}</span>
              </div>
              <div class="flash-word">\${vWord.english}</div>
              <div class="flash-ipa">\${vWord.ipa}</div>
              <div class="flash-vi">\${vWord.vietnamese}</div>
              <div class="flash-ex">
                <b style="color:#1e6a39;">"\${vWord.example}"</b><br>
                <span style="color:#668674;">\${vWord.exampleVi}</span>
              </div>
              <button class="dino-btn green" style="margin-top:14px;" onclick="speakText('\${vWord.english}')">🔊 Nghe Phát Âm Mẫu</button>
            </div>
            <div style="text-align:center;">\${getDinoImg('study', 'small')}</div>
            <div style="display:flex; gap:10px; margin-top:8px;">
              \${state.cardIndex > 0 ? \`<button class="dino-outline-btn" style="flex:1;" onclick="prevCard()">⬅ Trước</button>\` : ''}
              <button class="dino-btn" style="flex:2;" onclick="nextCard()">\${state.cardIndex === vLesson.words.length - 1 ? 'Hoàn Thành +5 ⭐' : 'Từ Tiếp Theo ➔'}</button>
            </div>
          \`;
          speakText(vWord.english);
          break;

        case 'pron':
          const pLesson = getLesson(state.currentTopicId, state.currentLessonId);
          const pWord = pLesson.words[state.cardIndex];
          const isPassed = state.recognizedText.toLowerCase().includes(pWord.english.toLowerCase());
          html = \`
            <div class="top-header">
              <button class="back-btn" onclick="navigate('activity_hub')">←</button>
              <span style="font-weight:900; color:#1a71c9;">Phát Âm: \${state.cardIndex + 1} / \${pLesson.words.length}</span>
              <span class="badge-star">⭐ \${state.stars}</span>
            </div>
            <div class="dino-card" style="text-align:center;">
              <div class="word-illustration-badge" style="background:radial-gradient(circle, #ebf5ff 0%, #d5eaff 100%); border-color:#fff; box-shadow:0 6px 0 #b3d7fc, 0 10px 20px rgba(29, 124, 214, 0.15);">
                <span class="word-emoji">\${pWord.emoji || '🌟'}</span>
              </div>
              <div style="font-size:36px; font-weight:900; color:#1869bc;">\${pWord.english}</div>
              <div class="flash-ipa">\${pWord.ipa}</div>
              <p style="color:#597968; margin:4px 0 10px; font-size:15px;">\${pWord.vietnamese}</p>
              <button class="dino-outline-btn" onclick="speakText('\${pWord.english}')">🔊 Nghe giọng mẫu</button>
              
              <div class="mic-button \${state.isListening ? 'listening' : ''}" onclick="toggleMic('\${pWord.english}')">
                \${state.isListening ? '⏹️' : '🎙️'}
              </div>
              <span style="font-size:13px; font-weight:700; color:#5b7c6b;">
                \${state.isListening ? 'Đang lắng nghe bé nói...' : 'Chạm micro để bé tập nói'}
              </span>

              \${state.recognizedText ? \`
                <div style="margin-top:12px; padding:10px; border-radius:14px; background:\${isPassed?'#e1fae6':'#fff0e0'};">
                  <b>Bé nói: "\${state.recognizedText}"</b><br>
                  <span style="color:\${isPassed?'#1f883d':'#d45d00'}; font-weight:800;">
                    \${isPassed ? '🌟 Xuất sắc! Phát âm rất chuẩn!' : '🌈 Chưa đúng lắm, bé hãy thử nói lại nhé!'}
                  </span>
                </div>
              \` : ''}

              <button class="dino-outline-btn" style="margin-top:10px; font-size:12px;" onclick="simulatePronCorrect('\${pWord.english}')">
                ⚡ Giả lập phát âm đúng (Test)
              </button>
            </div>
            <div style="text-align:center;">\${getDinoImg(state.isListening ? 'speak' : 'listen', 'small')}</div>
            <button class="dino-btn blue" onclick="nextPronCard()">\${state.cardIndex === pLesson.words.length - 1 ? 'Hoàn Thành Luyện Nói +5 ⭐' : 'Từ Tiếp Theo ➔'}</button>
          \`;
          break;

        case 'game':
          if (!state.quizQuestions.length) {
            initQuizGame();
          }
          const q = state.quizQuestions[state.quizRound];
          html = \`
            <div class="top-header">
              <button class="back-btn" onclick="navigate('activity_hub')">←</button>
              <span style="font-weight:900; color:#6d24d0;">Câu \${state.quizRound + 1} / \${state.quizQuestions.length}</span>
              <span class="badge-star">⭐ \${state.stars}</span>
            </div>
            <div class="dino-card" style="text-align:center; padding:14px;">
              <span style="font-size:13px; color:#688877; font-weight:700;">Bé hãy chọn đúng nghĩa của từ:</span>
              <div class="word-illustration-badge" style="width:84px; height:84px; margin:8px auto 6px; background:radial-gradient(circle, #f3ebff 0%, #e1d0fc 100%); border-color:#fff; box-shadow:0 5px 0 #cfb6fb;">
                <span class="word-emoji" style="font-size:46px;">\${q.target.emoji || '🌟'}</span>
              </div>
              <div style="font-size:30px; font-weight:900; color:#6d24d0; margin:2px 0 6px;">\${q.target.english}</div>
              <button class="dino-outline-btn" style="width:auto; padding:6px 14px; margin:auto;" onclick="speakText('\${q.target.english}')">🔊 Phát âm</button>
            </div>

            <div style="margin:10px 0;">
              \${q.options.map(opt => {
                let cls = '';
                if (state.quizAnswered) {
                  if (opt.id === q.target.id) cls = 'correct';
                  else if (opt.id === state.selectedAnswer) cls = 'wrong';
                }
                return \`
                  <button class="quiz-btn \${cls}" onclick="answerQuiz('\${opt.id}')" \${state.quizAnswered ? 'disabled' : ''}>
                    <span>\${opt.emoji || '⭐'} \${opt.vietnamese}</span>
                    <span>\${cls === 'correct' ? '✅' : cls === 'wrong' ? '❌' : ''}</span>
                  </button>
                \`;
              }).join('')}
            </div>

            <div style="text-align:center;">
              \${getDinoImg(state.quizAnswered ? (state.selectedAnswer === q.target.id ? 'clap' : 'reward') : 'think', 'small')}
            </div>

            \${state.quizAnswered ? \`
              <button class="dino-btn purple" onclick="nextQuizQuestion()">
                \${state.quizRound === state.quizQuestions.length - 1 ? 'Nhận Phần Thưởng 🏆' : 'Câu Tiếp Theo ➔'}
              </button>
            \` : ''}
          \`;
          break;

        case 'song':
          const sTopic = getTopic(state.currentTopicId);
          const sSong = sTopic.song;
          const line = sSong.lines[state.songLine];
          const lineVi = sSong.linesVi[state.songLine];
          html = \`
            <div class="top-header">
              <button class="back-btn" onclick="navigate('activity_hub')">←</button>
              <span style="font-weight:900; color:#d92338;">\${sSong.title}</span>
              <span class="badge-star">⭐ \${state.stars}</span>
            </div>
            <div class="progress-bar"><div class="progress-fill" style="width:\${((state.songLine+1)/sSong.lines.length)*100}%; background:#ff4a60;"></div></div>
            <div style="text-align:center;">\${getDinoImg('song', 'small')}</div>
            <div class="dino-card" style="text-align:center;">
              <span style="font-size:28px;">🎵</span>
              <h2 style="font-size:24px; color:#d92338; margin:8px 0;">\${line}</h2>
              <p style="font-size:15px; color:#6b8b79; margin:4px 0 14px;">\${lineVi}</p>
              <button class="dino-btn coral" onclick="speakText('\${line}')">🔊 Nghe Câu Hát</button>
            </div>
            <div style="display:flex; gap:10px;">
              \${state.songLine > 0 ? \`<button class="dino-outline-btn" style="flex:1;" onclick="prevSongLine()">⬅ Câu trước</button>\` : ''}
              <button class="dino-btn coral" style="flex:2;" onclick="nextSongLine()">\${state.songLine === sSong.lines.length - 1 ? 'Hoàn Thành Bài Hát +5 ⭐' : 'Câu Tiếp Theo ➔'}</button>
            </div>
          \`;
          speakText(line);
          break;

        case 'reward':
          const nextInfo = getNextLessonInfo();
          const curTopic = getTopic(state.currentTopicId);
          const curLesson = getLesson(state.currentTopicId, state.currentLessonId);

          html = \`
            <div style="text-align:center; padding:40px 0 20px;">
              \${getDinoImg('reward', 'big')}
              
              <div class="dino-card" style="margin-bottom:14px;">
                <h2 style="color:#28a44c; font-size:24px; margin:0 0 6px;">Chúc Mừng Bé! 🎉</h2>
                <p style="color:#577464; font-size:14px; margin:0 0 10px;">Bé vừa hoàn thành bài học tại <b>\${curTopic.nameVi}</b></p>
                <div class="badge-star" style="font-size:18px; padding:6px 18px;">⭐ +5 Ngôi Sao Vàng</div>
              </div>

              \${nextInfo ? \`
                <!-- THẺ GỢI Ý BÀI HỌC TIẾP THEO -->
                <div class="dino-card" style="background:linear-gradient(135deg, #fffbee 0%, #fff 100%); border:2.5px solid #ffbe2e; box-shadow:0 6px 0 #d9990e; text-align:left; margin-bottom:16px;">
                  <div style="display:flex; align-items:center; gap:8px; margin-bottom:6px;">
                    <span style="font-size:22px;">🚀</span>
                    <b style="color:#a86900; font-size:14px; text-transform:uppercase; letter-spacing:0.5px;">Gợi Ý Bài Học Tiếp Theo:</b>
                  </div>
                  <div style="display:flex; justify-content:space-between; align-items:center; margin-bottom:8px;">
                    <div>
                      <div style="font-size:18px; font-weight:900; color:#1e6a39;">Bài \${nextInfo.lesson.lessonId}: \${nextInfo.lesson.title}</div>
                      <div style="font-size:13px; color:#557563; font-weight:700;">
                        Chủ đề: \${nextInfo.topic.nameVi} \${nextInfo.isNewTopic ? '✨ (Chủ đề mới)' : ''} · 10 từ vựng
                      </div>
                    </div>
                    <span style="font-size:32px;">\${getTopicEmoji(nextInfo.topic.id) || '📖'}</span>
                  </div>
                  <button class="dino-btn" style="margin-top:6px; background:linear-gradient(180deg, #ffae11, #f59e0b); color:#3d2402; font-weight:900; font-size:17px; box-shadow:0 5px 0 #c77700;" onclick="startNextLesson('\${nextInfo.topic.id}', \${nextInfo.lesson.lessonId})">
                    Bắt Đầu Bài Tiếp Theo ➔
                  </button>
                </div>
              \` : \`
                <div class="dino-card" style="background:#eafbee; border-color:#84d89a; margin-bottom:14px;">
                  <b style="color:#1e7a3d;">🏆 Bé thật tuyệt vời! Đã hoàn thành tất cả 120 bài học!</b>
                </div>
              \`}

              <!-- Các nút phụ trợ -->
              <div style="display:flex; gap:10px; margin-bottom:10px;">
                <button class="dino-outline-btn" style="flex:1;" onclick="navigate('activity_hub')">↺ Ôn Lại Bài Này</button>
                <button class="dino-outline-btn" style="flex:1;" onclick="navigate('lessons', {topicId:'\${curTopic.id}'})">📋 Danh Sách Bài</button>
              </div>
              <button class="dino-outline-btn" style="width:100%;" onclick="navigate('growth')">🦖 Xem Dino Lớn Khôn</button>
            </div>
          \`;
          speakText("Awesome! You earned stars!");
          break;

        case 'growth':
          const curMilestone = getEvolutionMilestone();
          const currentLvl = curMilestone.level;
          const nextMilestone = DINO_MILESTONES.find(m => m.level === currentLvl + 1);
          const completedCount = state.completedLessons.length;
          const progressPercent = Math.min(100, Math.round((completedCount / 120) * 100));

          html = \`
            <div class="top-header">
              <h2 style="margin:0; font-size:20px; font-weight:900; color:#1e6a39;">Dino Trưởng Thành</h2>
              <span class="badge-star">⭐ \${state.stars}</span>
            </div>

            <!-- THẺ HERO DINO CẤP ĐỘ HIỆN TẠI -->
            <div class="dino-card" style="text-align:center; padding:18px 16px; margin-bottom:16px;">
              \${getDinoImg(curMilestone.mascot, 'big')}
              <h2 style="color:#1b592e; margin:8px 0 3px; font-size:22px;">Cột Mốc Cấp \${currentLvl} / 20</h2>
              <div style="font-size:16px; font-weight:900; color:#239446; margin-bottom:6px;">\${curMilestone.title}</div>
              
              <div style="display:inline-flex; align-items:center; gap:6px; background:#eafbee; border:1.5px solid #84d89a; color:#1e7a3d; font-size:12px; font-weight:800; padding:4px 12px; border-radius:12px; margin-bottom:10px;">
                <span>\${curMilestone.badge}</span>
                <span>\${curMilestone.stageName}</span>
              </div>

              <p style="font-size:13px; color:#5b7c6b; margin:0 0 10px; line-height:1.4;">\${curMilestone.desc}</p>
              
              <div class="progress-bar"><div class="progress-fill" style="width:\${progressPercent}%;"></div></div>
              <div style="display:flex; justify-content:space-between; font-size:12px; color:#688877; margin-top:4px; font-weight:700;">
                <span>Đã hoàn thành \${completedCount} / 120 bài</span>
                <span>\${progressPercent}% toàn khóa</span>
              </div>

              \${nextMilestone ? \`
                <div style="margin-top:10px; padding:8px 12px; background:#fffbee; border-radius:12px; border:1px solid #ffd67a; font-size:12px; color:#855400; font-weight:700; text-align:left;">
                  🚀 Cần thêm <b>\${Math.max(1, nextMilestone.requiredLessons - completedCount)} bài nữa</b> để đạt <b>Cấp \${nextMilestone.level}: \${nextMilestone.title}</b>!
                </div>
              \` : \`
                <div style="margin-top:10px; padding:8px 12px; background:#f4fbf5; border-radius:12px; border:1px solid #84d89a; font-size:12px; color:#1e7a3d; font-weight:800;">
                  🏆 Bé đã đưa Dino tiến hóa lên cấp cao nhất! Thủ khoa toàn năng!
                </div>
              \`}
            </div>

            <!-- DANH SÁCH 20 CẤP ĐỘ CÓ HÌNH ẢNH DINO TỪNG GIAI ĐOẠN -->
            <div style="display:flex; justify-content:space-between; align-items:center; margin:16px 0 10px;">
              <h4 style="margin:0; color:#1e6a39; font-size:16px; font-weight:900;">Hành trình 20 cấp độ:</h4>
              <span style="font-size:12px; color:#5c7e6c; font-weight:700;">4 giai đoạn tiến hóa</span>
            </div>

            <div style="display:flex; flex-direction:column; gap:8px;">
              \${DINO_MILESTONES.map(m => {
                const isCurrent = m.level === currentLvl;
                const unlocked = (completedCount >= m.requiredLessons) || (m.level === 1);
                
                return \`
                  <div class="tile-card" style="display:flex; align-items:center; gap:12px; padding:10px 12px; margin-bottom:0; border:2px solid \${isCurrent ? '#28a44c' : unlocked ? '#a8e5be' : '#e0ece5'}; background:\${isCurrent ? '#f2fbf4' : '#fff'}; box-shadow:\${isCurrent ? '0 4px 12px rgba(40,164,76,0.18)' : '0 2px 5px rgba(0,0,0,0.03)'}; border-radius:18px;">
                    
                    <!-- HÌNH ẢNH DINO 3D THỂ HIỆN SỰ TRƯỞNG THÀNH TỪNG CẤP ĐỘ -->
                    <div style="position:relative; width:56px; height:56px; flex-shrink:0; border-radius:16px; background:\${isCurrent ? '#d4f7de' : unlocked ? '#eafbee' : '#f4f6f5'}; border:2px solid \${isCurrent ? '#28a44c' : unlocked ? '#84d89a' : '#d2ded7'}; display:flex; align-items:center; justify-content:center; overflow:hidden;">
                      <img src="\${DINO_ASSETS[m.mascot]}" style="width:48px; height:48px; object-fit:contain; filter:\${unlocked ? 'none' : 'grayscale(60%) opacity(0.7)'};" alt="\${m.title}">
                      <span style="position:absolute; bottom:1px; right:1px; font-size:11px; line-height:1; background:rgba(255,255,255,0.95); border-radius:50%; padding:2px; box-shadow:0 1px 3px rgba(0,0,0,0.15);">\${m.badge}</span>
                    </div>

                    <!-- THÔNG TIN CHI TIẾT CẤP ĐỘ -->
                    <div style="flex:1; min-width:0;">
                      <div style="display:flex; align-items:center; gap:6px; flex-wrap:wrap;">
                        <b style="font-size:15px; color:\${isCurrent ? '#1e7a3d' : unlocked ? '#239446' : '#6b7d73'};">Cấp \${m.level}: \${m.title}</b>
                        \${isCurrent ? '<span style="background:#28a44c; color:#fff; font-size:10px; font-weight:900; padding:2px 7px; border-radius:10px;">HIỆN TẠI</span>' : ''}
                      </div>
                      <div style="font-size:12px; color:\${unlocked ? '#467258' : '#8a9e93'}; font-weight:700; margin-top:2px;">
                        \${m.stageName} · \${unlocked ? (isCurrent ? 'Đang học 🌟' : 'Đã mở ✨') : \`Cần \${m.requiredLessons} bài\`}
                      </div>
                    </div>

                    <!-- TRẠNG THÁI KHÓA / HOÀN THÀNH -->
                    <div style="flex-shrink:0;">
                      \${isCurrent ? '<span style="font-size:22px;">🌟</span>' : unlocked ? '<span style="font-size:18px; color:#28a44c; font-weight:900;">✓</span>' : '<span style="font-size:16px; opacity:0.5;">🔒</span>'}
                    </div>
                  </div>
                \`;
              }).join('')}
            </div>
          \`;
          break;

        case 'profile':
          html = \`
            <div class="top-header">
              <h2 style="margin:0; font-size:20px; font-weight:900; color:#1e6a39;">Hồ Sơ Của Bé</h2>
              <span class="badge-star">⭐ \${state.stars}</span>
            </div>

            <!-- THẺ THÔNG TIN BÉ HIỆN TẠI -->
            <div class="dino-card" style="text-align:center; padding:16px;">
              <div class="mascot-box" style="margin:0 auto 8px;">
                \${getDinoImg(state.activeChild?.avatar_url || 'welcome', 'small')}
              </div>
              <h3 style="color:#1e7a3d; margin:0 0 4px; font-size:20px; font-weight:900;">\${state.kidName}</h3>
              <div style="display:inline-block; background:#eafbee; border:1px solid #84d89a; color:#1e7a3d; font-size:12px; font-weight:800; padding:3px 10px; border-radius:12px; margin-bottom:12px;">
                Nhóm tuổi: \${state.activeChild?.age_group || '6–8 tuổi'} · Cột mốc Cấp \${getEvolutionLevel()} / 20
              </div>

              <div style="display:grid; grid-template-columns:1fr 1fr; gap:8px; margin-bottom:12px;">
                <div style="background:#f4fbf5; border:1px solid #c8ecd2; border-radius:12px; padding:8px;">
                  <div style="font-size:16px; font-weight:900; color:#d48a0d;">⭐ \${state.stars}</div>
                  <div style="font-size:11px; color:#5c7e6c; font-weight:700;">Sao vàng</div>
                </div>
                <div style="background:#f4fbf5; border:1px solid #c8ecd2; border-radius:12px; padding:8px;">
                  <div style="font-size:16px; font-weight:900; color:#1d7cd6;">\${state.completedLessons.length} / 120</div>
                  <div style="font-size:11px; color:#5c7e6c; font-weight:700;">Bài đã học</div>
                </div>
              </div>

              <div style="display:flex; gap:8px;">
                <button class="dino-btn green" style="flex:1; font-size:13px; padding:10px;" onclick="navigate('parent_dashboard')">
                  👨‍👩‍👧 Khu Vực Phụ Huynh ➔
                </button>
                \${state.children && state.children.length > 1 ? \`
                  <button class="dino-outline-btn" style="font-size:13px; padding:10px;" onclick="navigate('parent_dashboard')">
                    🔄 Đổi Bé
                  </button>
                \` : ''}
              </div>
            </div>

            <!-- THẺ ĐỒNG BỘ CLOUD SUPABASE (PROJECT: wsaalmeuduiyqbptnrmy) -->
            <div class="dino-card" style="border:2px solid \${state.supabaseUser ? '#28a44c' : '#57a0d3'}; background:\${state.supabaseUser ? '#f2fbf5' : '#f4faff'};">
              <div style="display:flex; justify-content:space-between; align-items:center; margin-bottom:8px;">
                <b style="color:\${state.supabaseUser ? '#1e7a3d' : '#1d6fa5'}; font-size:16px;">☁️ Supabase Cloud Sync</b>
                <span style="font-size:11px; font-weight:800; background:\${state.supabaseUser ? '#28a44c' : '#57a0d3'}; color:#fff; padding:2px 8px; border-radius:10px;">
                  \${state.supabaseUser ? 'ĐÃ KẾT NỐI' : 'CHƯA ĐĂNG NHẬP'}
                </span>
              </div>

              \${state.supabaseUser ? \`
                <div style="font-size:13px; color:#3d6550; margin-bottom:6px;">
                  Tài khoản: <b>\${state.supabaseUser.email}</b>
                </div>
                <div style="font-size:12px; color:#5c836f; margin-bottom:10px;">
                  Đã ghi nhớ: <b>\${state.completedLessons.length} bài học</b> & <b>\${state.stars} sao</b>.
                </div>
                \${state.syncStatus ? \`<div style="font-size:12px; color:#1e7a3d; margin-bottom:8px; font-weight:700;">\${state.syncStatus}</div>\` : ''}
                <div style="display:flex; gap:8px;">
                  <button class="dino-btn green" style="flex:2; font-size:13px; padding:8px;" onclick="handleCloudSync()">🔄 Đồng Bộ Ngay</button>
                  <button class="dino-outline-btn" style="flex:1; font-size:13px; padding:8px; color:#d42638; border-color:#f09ea7;" onclick="handleCloudLogout()">Đăng Xuất</button>
                </div>
              \` : \`
                <p style="font-size:12px; color:#577464; margin:0 0 10px; line-height:1.4;">
                  Đăng nhập tài khoản phụ huynh để lưu vĩnh viễn tiến độ học của bé và tiếp tục học trên các thiết bị khác!
                </p>
                <button class="dino-btn blue" style="font-size:13px; padding:10px;" onclick="navigate('login')">
                  🔐 Đăng Nhập / Đăng Ký Supabase ➔
                </button>
              \`}
            </div>

            <div class="dino-card">
              <h4 style="margin:0 0 10px; color:#1e6a39;">Cài đặt tốc độ giọng đọc</h4>
              <div style="display:flex; justify-content:space-between; font-size:13px; margin-bottom:6px;">
                <span>Chậm</span>
                <b>\${state.speechRate}x</b>
                <span>Nhanh</span>
              </div>
              <input type="range" min="0.5" max="1.1" step="0.05" value="\${state.speechRate}" style="width:100%;" onchange="state.speechRate=parseFloat(this.value)">
            </div>

            <button class="dino-outline-btn" style="color:#d42638; border-color:#f09ea7;" onclick="resetAllProgress()">
              ⚠️ Đặt lại toàn bộ tiến độ học tập
            </button>
          \`;
          break;
      }

      root.innerHTML = html;
    }

    // Helper functions & Supabase Auth Actions
    function togglePasswordVisibility(which) {
      let inputEl, btnEl;
      if (which === 'confirm') {
        inputEl = document.getElementById('signupConfirmPassword');
        state.showConfirmPassword = !state.showConfirmPassword;
        btnEl = inputEl?.parentElement?.querySelector('.toggle-pwd-btn');
      } else if (which === 'login') {
        inputEl = document.getElementById('loginPassword');
        state.showPassword = !state.showPassword;
        btnEl = inputEl?.parentElement?.querySelector('.toggle-pwd-btn');
      } else {
        inputEl = document.getElementById('signupPassword');
        state.showPassword = !state.showPassword;
        btnEl = inputEl?.parentElement?.querySelector('.toggle-pwd-btn');
      }

      if (inputEl) {
        const isPwd = inputEl.type === 'password';
        inputEl.type = isPwd ? 'text' : 'password';
        if (btnEl) {
          btnEl.innerText = isPwd ? '🙈' : '👁️';
        }
        return; // Không gọi render(): Giữ nguyên 100% dữ liệu đã nhập trong tất cả các ô!
      }
      render();
    }

    function guestLogin() {
      state.kidName = state.kidName || 'Bé Na';
      localStorage.setItem('dino_onboard_completed', 'true');
      saveState();
      navigate('home');
    }

    async function handleLogin() {
      const email = (document.getElementById('loginEmail')?.value || '').trim();
      const password = (document.getElementById('loginPassword')?.value || '').trim();
      const rememberMe = document.getElementById('rememberMe')?.checked ?? true;

      state.loginFormData = { email, password };

      if (!email || !password) {
        state.authError = "Vui lòng nhập đầy đủ Email và Mật khẩu!";
        render();
        return;
      }

      if (rememberMe) {
        localStorage.setItem('dino_remember_email', email);
      } else {
        localStorage.removeItem('dino_remember_email');
      }

      initSupabase();
      if (!state.supabaseClient) {
        state.authError = "Chưa kết nối được với hệ thống xác thực!";
        render();
        return;
      }

      state.isSubmitting = true;
      state.authError = '';
      state.authSuccess = '';
      render();

      try {
        const { data, error } = await state.supabaseClient.auth.signInWithPassword({
          email: email,
          password: password
        });

        if (error) {
          state.authError = "Đăng nhập thất bại: " + (error.message.includes('Invalid login') ? 'Email hoặc mật khẩu không chính xác' : error.message);
          state.isSubmitting = false;
          render();
          return;
        }

        if (data && data.user) {
          localStorage.setItem('dino_onboard_completed', 'true');
          await handleSessionSuccess(data.user);
        }
      } catch (err) {
        state.authError = "Lỗi kết nối: " + (err.message || err);
      } finally {
        state.isSubmitting = false;
        render();
      }
    }

    async function handleSignUp() {
      const fullName = (document.getElementById('signupFullName')?.value || '').trim();
      const email = (document.getElementById('signupEmail')?.value || '').trim();
      const password = (document.getElementById('signupPassword')?.value || '').trim();
      const confirmPassword = (document.getElementById('signupConfirmPassword')?.value || '').trim();
      const termsAccepted = document.getElementById('signupTerms')?.checked;

      // Lưu ngay vào state để khi render lỗi thì toàn bộ dữ liệu người dùng nhập vẫn còn nguyên!
      state.signupFormData = { fullName, email, password, confirmPassword };

      if (!fullName) {
        state.authError = "Vui lòng nhập họ và tên phụ huynh!";
        render();
        return;
      }
      if (!email || !email.includes('@')) {
        state.authError = "Vui lòng nhập email hợp lệ!";
        render();
        return;
      }
      if (!password || password.length < 6) {
        state.authError = "Mật khẩu cần có tối thiểu 6 ký tự!";
        render();
        return;
      }
      if (password !== confirmPassword) {
        state.authError = "Mật khẩu xác nhận không khớp!";
        render();
        return;
      }
      if (!termsAccepted) {
        state.authError = "Vui lòng đồng ý với Điều khoản sử dụng và Chính sách bảo mật!";
        render();
        return;
      }

      initSupabase();
      if (!state.supabaseClient) {
        state.authError = "Vui lòng cấu hình Supabase Publishable Anon Key trước!";
        render();
        return;
      }

      state.isSubmitting = true;
      state.authError = '';
      render();

      try {
        const redirectUrl = window.location.origin + window.location.pathname;
        const { data, error } = await state.supabaseClient.auth.signUp({
          email: email,
          password: password,
          options: {
            emailRedirectTo: redirectUrl,
            data: {
              full_name: fullName
            }
          }
        });

        if (error) {
          state.authError = "Đăng ký thất bại: " + error.message;
          state.isSubmitting = false;
          render();
          return;
        }

        if (data.session) {
          await handleSessionSuccess(data.user);
        } else {
          state.pendingVerifyEmail = email;
          state.authSuccess = "Đăng ký thành công! Vui lòng xác thực email.";
          navigate('verify_email');
        }
      } catch (err) {
        state.authError = "Lỗi hệ thống: " + (err.message || err);
      } finally {
        state.isSubmitting = false;
        render();
      }
    }

    async function handleResendVerification() {
      if (!state.pendingVerifyEmail) return;
      initSupabase();
      if (!state.supabaseClient) return;
      try {
        const redirectUrl = window.location.origin + window.location.pathname;
        await state.supabaseClient.auth.resend({
          type: 'signup',
          email: state.pendingVerifyEmail,
          options: { emailRedirectTo: redirectUrl }
        });
        state.authSuccess = "Đã gửi lại mã xác thực! Vui lòng kiểm tra email của bạn.";
        state.authError = '';
        render();
      } catch (e) {
        state.authError = "Lỗi gửi lại mã: " + (e.message || e);
        render();
      }
    }

    async function handleVerifyOtp() {
      const codeInput = document.getElementById('otpCodeInput');
      const token = (codeInput ? codeInput.value : '').trim().replace(/\s+/g, '');
      if (!token || token.length < 4) {
        state.authError = "Vui lòng nhập đầy đủ mã xác thực được gửi về email!";
        render();
        return;
      }

      state.isSubmitting = true;
      state.authError = '';
      state.authSuccess = '';
      render();

      try {
        initSupabase();
        if (!state.supabaseClient) throw new Error("Chưa khởi tạo kết nối Supabase!");

        // 1. Thử xác thực với type: 'signup'
        let res = await state.supabaseClient.auth.verifyOtp({
          email: state.pendingVerifyEmail,
          token: token,
          type: 'signup'
        });

        // 2. Fallback sang type: 'email' nếu type 'signup' trả lỗi
        if (res.error) {
          const retry = await state.supabaseClient.auth.verifyOtp({
            email: state.pendingVerifyEmail,
            token: token,
            type: 'email'
          });
          if (!retry.error) {
            res = retry;
          }
        }

        if (res.error) {
          state.authError = "Mã xác thực không chính xác hoặc đã hết hạn (" + (res.error.message || 'Lỗi OTP') + ")! Vui lòng thử lại.";
          state.isSubmitting = false;
          render();
          return;
        }

        // Đã xác thực thành công (Pass)!
        // Theo yêu cầu của người dùng: "tôi nhập mã trên app pass thì về màn hình đăng nhập"
        try {
          await state.supabaseClient.auth.signOut();
        } catch(e){}

        state.authSuccess = "🎉 Xác thực tài khoản thành công! Vui lòng đăng nhập để bắt đầu học.";
        state.authError = '';
        state.isSubmitting = false;
        navigate('login');
      } catch (err) {
        state.authError = "Lỗi xác thực: " + (err.message || err);
        state.isSubmitting = false;
        render();
      }
    }

    async function handleForgotPassword() {
      const email = document.getElementById('forgotEmail')?.value.trim();
      if (!email || !email.includes('@')) {
        state.authError = "Vui lòng nhập email hợp lệ!";
        render();
        return;
      }

      initSupabase();
      if (!state.supabaseClient) return;

      state.isSubmitting = true;
      state.authError = '';
      render();

      try {
        const redirectUrl = window.location.origin + window.location.pathname;
        const { error } = await state.supabaseClient.auth.resetPasswordForEmail(email, {
          redirectTo: redirectUrl
        });
        if (error) {
          state.authError = "Không thể gửi email: " + error.message;
        } else {
          state.authSuccess = "Đã gửi hướng dẫn khôi phục mật khẩu đến email " + email;
        }
      } catch (err) {
        state.authError = "Lỗi: " + (err.message || err);
      } finally {
        state.isSubmitting = false;
        render();
      }
    }

    async function handleResetPassword() {
      const pwd = document.getElementById('resetPassword')?.value.trim();
      const confirmPwd = document.getElementById('resetConfirmPassword')?.value.trim();

      if (!pwd || pwd.length < 6) {
        state.authError = "Mật khẩu mới phải có ít nhất 6 ký tự!";
        render();
        return;
      }
      if (pwd !== confirmPwd) {
        state.authError = "Xác nhận mật khẩu không khớp!";
        render();
        return;
      }

      initSupabase();
      if (!state.supabaseClient) return;

      state.isSubmitting = true;
      state.authError = '';
      render();

      try {
        const { error } = await state.supabaseClient.auth.updateUser({ password: pwd });
        if (error) {
          state.authError = "Lỗi cập nhật mật khẩu: " + error.message;
        } else {
          alert("Cập nhật mật khẩu thành công! Vui lòng đăng nhập lại.");
          navigate('login');
        }
      } catch (err) {
        state.authError = "Lỗi: " + (err.message || err);
      } finally {
        state.isSubmitting = false;
        render();
      }
    }

    async function handleCreateChild() {
      const name = document.getElementById('setupChildName')?.value.trim();
      if (!name) {
        state.authError = "Vui lòng nhập tên thân mật của bé!";
        render();
        return;
      }

      state.kidName = name;
      state.isSubmitting = true;
      state.authError = '';
      render();

      if (state.supabaseClient && state.supabaseUser) {
        try {
          const { data, error } = await state.supabaseClient.rpc('create_child_profile', {
            p_display_name: name,
            p_age_group: state.selectedAgeGroup || '6-8',
            p_avatar_url: state.selectedAvatar || 'welcome',
            p_initial_level: state.selectedLevel || 'beginner'
          });

          if (!error && data) {
            state.activeChildId = data;
          }

          // Reload children
          const { data: kids } = await state.supabaseClient
            .from('children')
            .select('*')
            .eq('parent_id', state.supabaseUser.id)
            .order('created_at', { ascending: true });
          state.children = kids || [];
          const cur = state.children.find(k => k.id === state.activeChildId) || state.children[state.children.length - 1];
          if (cur) await setActiveChild(cur.id);
        } catch (e) {
          console.warn("Create child error:", e);
        }
      }

      saveState();
      state.isSubmitting = false;
      navigate('home');
    }

    async function handleSwitchChild(childId) {
      await setActiveChild(childId);
      navigate('home');
    }

    async function handleDeleteChild(childId, name) {
      if (state.children.length <= 1) {
        alert("Bạn phải giữ lại ít nhất một hồ sơ bé!");
        return;
      }
      if (!confirm(\`Bạn có chắc chắn muốn xóa hồ sơ bé "\${name}"? Toàn bộ tiến độ học của bé sẽ bị xóa.\`)) {
        return;
      }

      if (state.supabaseClient) {
        try {
          await state.supabaseClient.from('children').delete().eq('id', childId);
          state.children = state.children.filter(k => k.id !== childId);
          if (state.activeChildId === childId) {
            await setActiveChild(state.children[0].id);
          }
          render();
        } catch (e) {
          alert("Lỗi khi xóa: " + e.message);
        }
      }
    }

    async function handleDeleteAccount() {
      const confirmText = prompt("Để xác nhận xóa vĩnh viễn tài khoản và toàn bộ dữ liệu của các bé, vui lòng gõ 'XOA':");
      if (confirmText === 'XOA') {
        if (state.supabaseClient && state.supabaseUser) {
          try {
            await state.supabaseClient.from('profiles').delete().eq('id', state.supabaseUser.id);
            await state.supabaseClient.auth.signOut();
          } catch (e) {
            console.warn(e);
          }
        }
        localStorage.clear();
        state.supabaseUser = null;
        state.children = [];
        state.activeChild = null;
        state.completedLessons = [];
        state.stars = 10;
        alert("Tài khoản và dữ liệu đã được xóa hoàn tất.");
        navigate('login');
      }
    }

    async function syncLessonToSupabase(topicId, lessonId, activityKey = 'vocab', points = 5) {
      if (!state.supabaseClient || !state.supabaseUser || !state.activeChildId) return;
      const lKey = \`\${topicId}_l\${lessonId}\`;

      try {
        const { data, error } = await state.supabaseClient.rpc('complete_lesson_activity', {
          p_child_id: state.activeChildId,
          p_lesson_id: lKey,
          p_activity_type: activityKey,
          p_score: 100,
          p_stars_delta: points,
          p_words_learned: 10,
          p_duration_seconds: 60
        });

        if (error) {
          console.warn("Sync lesson RPC error:", error);
        } else if (data) {
          if (data.total_stars !== undefined) {
            state.stars = data.total_stars;
            saveState();
          }
        }
      } catch (e) {
        console.warn("Background sync error:", e);
      }
    }

    async function loadCloudProgress() {
      if (!state.supabaseClient || !state.supabaseUser) return;
      try {
        const { data: kids } = await state.supabaseClient
          .from('children')
          .select('*')
          .eq('parent_id', state.supabaseUser.id)
          .order('created_at', { ascending: true });

        if (kids && kids.length > 0) {
          state.children = kids;
          const currentKid = kids.find(k => k.id === state.activeChildId) || kids[0];
          await setActiveChild(currentKid.id);
        }
      } catch (e) {
        console.warn("loadCloudProgress error:", e);
      }
    }

    async function handleCloudSync() {
      if (!state.supabaseUser) return;
      await loadCloudProgress();
      for (const lKey of state.completedLessons) {
        const parts = lKey.split('_l');
        if (parts.length === 2) {
          await syncLessonToSupabase(parts[0], parseInt(parts[1], 10));
        }
      }
      state.syncStatus = \`Đã đồng bộ an toàn \${state.completedLessons.length} bài học!\`;
      render();
    }

    async function handleCloudLogout() {
      if (state.supabaseClient) {
        try { await state.supabaseClient.auth.signOut(); } catch(e){}
      }
      state.supabaseUser = null;
      state.parentProfile = null;
      state.children = [];
      state.activeChild = null;
      saveState();
      render();
      alert("Đã đăng xuất tài khoản Supabase!");
    }

    function nextOnboard() {
      if (state.onboardStep < 2) {
        state.onboardStep++;
        render();
      } else {
        localStorage.setItem('dino_onboard_completed', 'true');
        navigate('login');
      }
    }

    function loginSubmit() {
      const input = document.getElementById('kidNameInput');
      if (input && input.value.trim()) {
        state.kidName = input.value.trim();
        saveState();
      }
      localStorage.setItem('dino_onboard_completed', 'true');
      navigate('home');
    }

    function nextCard() {
      const vLesson = getLesson(state.currentTopicId, state.currentLessonId);
      if (state.cardIndex < vLesson.words.length - 1) {
        state.cardIndex++;
        render();
      } else {
        rewardPoints(state.currentTopicId, state.currentLessonId, 'vocab', 5);
        navigate('reward');
      }
    }

    function prevCard() {
      if (state.cardIndex > 0) {
        state.cardIndex--;
        render();
      }
    }

    function toggleMic(targetWord) {
      if (!('webkitSpeechRecognition' in window) && !('SpeechRecognition' in window)) {
        alert("Trình duyệt không hỗ trợ Web Speech API. Bạn có thể dùng nút 'Giả lập phát âm đúng' bên dưới để kiểm thử!");
        return;
      }
      if (state.isListening) {
        state.isListening = false;
        render();
        return;
      }
      const SpeechRecognition = window.SpeechRecognition || window.webkitSpeechRecognition;
      const recognizer = new SpeechRecognition();
      recognizer.lang = 'en-US';
      recognizer.interimResults = false;
      recognizer.maxAlternatives = 1;

      state.isListening = true;
      state.recognizedText = '';
      render();

      recognizer.onresult = function(e) {
        state.recognizedText = e.results[0][0].transcript;
        state.isListening = false;
        render();
      };
      recognizer.onerror = function() {
        state.isListening = false;
        render();
      };
      recognizer.start();
    }

    function simulatePronCorrect(word) {
      state.recognizedText = word;
      render();
    }

    function nextPronCard() {
      const pLesson = getLesson(state.currentTopicId, state.currentLessonId);
      if (state.cardIndex < pLesson.words.length - 1) {
        state.cardIndex++;
        state.recognizedText = '';
        render();
      } else {
        rewardPoints(state.currentTopicId, state.currentLessonId, 'pron', 5);
        navigate('reward');
      }
    }

    function initQuizGame() {
      const l = getLesson(state.currentTopicId, state.currentLessonId);
      state.quizQuestions = [];
      state.quizRound = 0;
      state.quizScore = 0;
      state.quizAnswered = false;
      state.selectedAnswer = null;

      // Pick 5 random words from lesson
      const shuffled = [...l.words].sort(() => 0.5 - Math.random()).slice(0, 5);
      shuffled.forEach(target => {
        const distractors = l.words.filter(w => w.id !== target.id).sort(() => 0.5 - Math.random()).slice(0, 3);
        const options = [...distractors, target].sort(() => 0.5 - Math.random());
        state.quizQuestions.push({ target, options });
      });
    }

    function answerQuiz(optId) {
      state.quizAnswered = true;
      state.selectedAnswer = optId;
      const currentQ = state.quizQuestions[state.quizRound];
      if (optId === currentQ.target.id) {
        state.quizScore += 2;
        speakText("Great job!");
      } else {
        speakText("Try again!");
      }
      render();
    }

    function nextQuizQuestion() {
      if (state.quizRound < state.quizQuestions.length - 1) {
        state.quizRound++;
        state.quizAnswered = false;
        state.selectedAnswer = null;
        render();
      } else {
        rewardPoints(state.currentTopicId, state.currentLessonId, 'game', 10);
        navigate('reward');
      }
    }

    function nextSongLine() {
      const s = getTopic(state.currentTopicId).song;
      if (state.songLine < s.lines.length - 1) {
        state.songLine++;
        render();
      } else {
        rewardPoints(state.currentTopicId, 1, 'song', 5);
        navigate('reward');
      }
    }

    function prevSongLine() {
      if (state.songLine > 0) {
        state.songLine--;
        render();
      }
    }

    function resetAllProgress() {
      if (confirm("Bạn có chắc chắn muốn đặt lại toàn bộ sao và các bài học về ban đầu?")) {
        state.stars = 10;
        state.completedLessons = [];
        state.completedActivities = [];
        saveState();
        navigate('home');
      }
    }

    function openDailyGift() {
      const today = new Date().toDateString();
      const lastClaimed = localStorage.getItem('dino_gift_date');
      if (lastClaimed === today) {
        alert("🎁 Bé đã nhận phần quà chăm chỉ của ngày hôm nay rồi! Ngày mai nhớ quay lại học để mở quà tiếp nhé!");
      } else {
        localStorage.setItem('dino_gift_date', today);
        state.stars += 5;
        saveState();
        render();
        alert("🎉 Chúc mừng bé yêu! Hộp Quà May Mắn đã mở: Tặng bé +5 ⭐ tích lũy chăm chỉ!");
      }
    }

    function getTopicEmoji(id) {
      const emojis = {
        animals: '🐱', colors: '🎨', fruits: '🍎', family: '👨‍👩‍👧',
        food: '🍕', body: '👀', school: '🎒', nature: '🌿',
        vehicles: '🚗', clothing: '👕', feelings: '😊', actions: '⚡'
      };
      return emojis[id] || '⭐';
    }

    function getWordIcon(item) {
      if (!item) return '🌟';
      if (typeof item === 'object') return item.emoji || '🌟';
      return item;
    }

    // Initialize
    initSessionAndRouting();
    render();
  </script>
</body>
</html>
`;

fs.writeFileSync(previewHtmlPath, htmlTemplate, 'utf-8');
console.log(`Successfully generated iPhone 16 Pro Web Simulator at: ${previewHtmlPath}`);

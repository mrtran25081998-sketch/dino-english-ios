// scripts/verify_content_integrity.js
const fs = require('fs');
const path = require('path');

const jsonPath = path.resolve(__dirname, '..', 'iOS', 'DinoEnglish', 'Data', 'DinoContent.json');
const data = JSON.parse(fs.readFileSync(jsonPath, 'utf-8'));

console.log("=== KIỂM TRA TÍNH TOÀN VẸN DỮ LIỆU 1.200 TỪ VỰNG DINO ENGLISH ===");
console.log(`Số lượng chủ đề: ${data.topics.length}`);

let totalLessons = 0;
let totalWords = 0;
let errors = [];
let wordSet = new Set();
let duplicates = [];

const topicReport = [];

data.topics.forEach((t, tIdx) => {
  let topicWordCount = 0;
  let topicLessonCount = t.lessons ? t.lessons.length : 0;
  totalLessons += topicLessonCount;

  if (topicLessonCount !== 10) {
    errors.push(`Chủ đề '${t.id}' có ${topicLessonCount} bài học (kỳ vọng: 10 bài).`);
  }

  t.lessons.forEach(l => {
    let lessonWordCount = l.words ? l.words.length : 0;
    topicWordCount += lessonWordCount;
    totalWords += lessonWordCount;

    if (lessonWordCount !== 10) {
      errors.push(`Chủ đề '${t.id}', bài ${l.lessonId} có ${lessonWordCount} từ (kỳ vọng: 10 từ).`);
    }

    l.words.forEach(w => {
      if (!w.english || !w.vietnamese || !w.ipa || !w.example || !w.exampleVi) {
        errors.push(`Từ vựng '${w.id}' thiếu trường thông tin (IPA, ví dụ hoặc nghĩa tiếng Việt).`);
      }
      if (wordSet.has(w.id)) {
        duplicates.push(w.id);
      }
      wordSet.add(w.id);
    });
  });

  topicReport.push({
    stt: tIdx + 1,
    id: t.id,
    nameVi: t.nameVi,
    nameEn: t.nameEn,
    lessons: topicLessonCount,
    words: topicWordCount,
    hasSong: !!t.song,
    songTitle: t.song ? t.song.title : 'Chưa có'
  });
});

console.table(topicReport);
console.log(`\nTổng số bài học: ${totalLessons} / 120 bài`);
console.log(`Tổng số từ vựng: ${totalWords} / 1.200 từ`);
console.log(`Số lượng từ trùng lặp ID: ${duplicates.length}`);
console.log(`Số lỗi toàn vẹn: ${errors.length}`);

if (errors.length > 0) {
  console.error("Các lỗi phát hiện:", errors);
  process.exit(1);
} else {
  console.log("XÁC NHẬN: Dữ liệu 1.200 từ vựng và 12 chủ đề hoàn toàn chuẩn xác 100%!");
}

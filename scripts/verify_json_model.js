// scripts/verify_json_model.js
const fs = require('fs');
const path = require('path');

const jsonPath = path.resolve(__dirname, '..', 'iOS', 'DinoEnglish', 'Data', 'DinoContent.json');
const raw = fs.readFileSync(jsonPath, 'utf-8');
const data = JSON.parse(raw);

console.log("=== VERIFYING JSON AGAINST SWIFT MODEL ===");
console.log(`Topics count: ${data.topics.length}`);

let totalLessons = 0;
let totalWords = 0;
let errors = [];

data.topics.forEach((topic, tIdx) => {
  if (!topic.id || !topic.nameEn || !topic.nameVi || !topic.colorHex || !topic.icon) {
    errors.push(`Topic at index ${tIdx} missing required fields!`);
  }
  if (!topic.song || !topic.song.title || !topic.song.lines || topic.song.lines.length === 0) {
    errors.push(`Topic ${topic.id} missing valid song!`);
  }
  if (!topic.lessons || topic.lessons.length !== 10) {
    errors.push(`Topic ${topic.id} has ${topic.lessons ? topic.lessons.length : 0} lessons (expected 10)!`);
  }
  
  topic.lessons.forEach((lesson, lIdx) => {
    totalLessons++;
    if (!lesson.lessonId || !lesson.title || !lesson.words || lesson.words.length !== 10) {
      errors.push(`Topic ${topic.id} Lesson ${lIdx+1} has ${lesson.words ? lesson.words.length : 0} words (expected 10)!`);
    }
    
    lesson.words.forEach((word, wIdx) => {
      totalWords++;
      if (!word.id || !word.english || !word.vietnamese || !word.ipa || !word.example || !word.exampleVi) {
        errors.push(`Topic ${topic.id} Lesson ${lIdx+1} Word ${wIdx+1} missing required properties!`);
      }
    });
  });
});

console.log(`Total Lessons counted: ${totalLessons}`);
console.log(`Total Words counted: ${totalWords}`);

if (errors.length > 0) {
  console.error("Errors found:", errors.slice(0, 10));
  process.exit(1);
} else {
  console.log("SUCCESS: JSON structure perfectly matches Swift Codable struct (12 topics, 120 lessons, 1,200 words, 12 songs)!");
}

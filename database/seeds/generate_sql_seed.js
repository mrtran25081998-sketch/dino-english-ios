// database/seeds/generate_sql_seed.js
const fs = require('fs');
const path = require('path');

const jsonPath = path.resolve(__dirname, '..', '..', 'iOS', 'DinoEnglish', 'Data', 'DinoContent.json');
const outSqlPath = path.resolve(__dirname, '01_content_seed.sql');

if (!fs.existsSync(jsonPath)) {
  console.error("DinoContent.json not found at:", jsonPath);
  process.exit(1);
}

const data = JSON.parse(fs.readFileSync(jsonPath, 'utf-8'));

function escapeSql(str) {
  if (str === null || str === undefined) return 'NULL';
  return "'" + String(str).replace(/'/g, "''") + "'";
}

let sql = `-- ==============================================================================
-- DINO ENGLISH — SEED CONTENT (12 CHỦ ĐỀ · 120 BÀI HỌC · 1.200 TỪ VỰNG · 12 BÀI HÁT)
-- Tự động sinh từ: iOS/DinoEnglish/Data/DinoContent.json
-- Đảm bảo tính toàn vẹn: 12 topics x 10 lessons x 10 words = 1.200 từ vựng chuẩn IPA
-- ==============================================================================

BEGIN;

-- 1. SEED 12 TOPICS
`;

const topicColors = {
  animals: '#30a953',
  colors: '#e63946',
  fruits: '#f77f00',
  family: '#fcbf49',
  food: '#d62828',
  body: '#0077b6',
  school: '#457b9d',
  nature: '#2a9d8f',
  vehicles: '#e76f51',
  clothing: '#9b5de5',
  feelings: '#f15bb5',
  actions: '#00bbf9'
};

data.topics.forEach((t, tIdx) => {
  const color = topicColors[t.id] || '#30a953';
  sql += `INSERT INTO public.topics (id, name_vi, name_en, description, color_hex, display_order, is_active)
VALUES (${escapeSql(t.id)}, ${escapeSql(t.nameVi)}, ${escapeSql(t.nameEn)}, ${escapeSql(t.description)}, ${escapeSql(color)}, ${tIdx + 1}, true)
ON CONFLICT (id) DO UPDATE SET name_vi = EXCLUDED.name_vi, name_en = EXCLUDED.name_en, description = EXCLUDED.description, color_hex = EXCLUDED.color_hex;\n`;
});

sql += `\n-- 2. SEED 120 LESSONS\n`;
let totalLessons = 0;
let totalWords = 0;

data.topics.forEach(t => {
  t.lessons.forEach(l => {
    totalLessons++;
    const lessonKey = `${t.id}_l${l.lessonId}`;
    sql += `INSERT INTO public.lessons (id, topic_id, title_vi, title_en, lesson_number, difficulty, display_order, is_active)
VALUES (${escapeSql(lessonKey)}, ${escapeSql(t.id)}, ${escapeSql(l.title)}, ${escapeSql(l.title)}, ${l.lessonId}, ${escapeSql(l.difficulty || 'beginner')}, ${l.lessonId}, true)
ON CONFLICT (id) DO UPDATE SET title_vi = EXCLUDED.title_vi, title_en = EXCLUDED.title_en, difficulty = EXCLUDED.difficulty;\n`;
  });
});

sql += `\n-- 3. SEED 1.200 VOCABULARY WORDS\n`;
data.topics.forEach(t => {
  t.lessons.forEach(l => {
    const lessonKey = `${t.id}_l${l.lessonId}`;
    l.words.forEach((w, wIdx) => {
      totalWords++;
      sql += `INSERT INTO public.vocabulary (id, lesson_id, word_en, meaning_vi, phonetic, example_sentence, example_translation, symbol_name, display_order)
VALUES (${escapeSql(w.id)}, ${escapeSql(lessonKey)}, ${escapeSql(w.english)}, ${escapeSql(w.vietnamese)}, ${escapeSql(w.ipa)}, ${escapeSql(w.example)}, ${escapeSql(w.exampleVi)}, ${escapeSql(w.symbolName || 'star.fill')}, ${wIdx + 1})
ON CONFLICT (id) DO UPDATE SET word_en = EXCLUDED.word_en, meaning_vi = EXCLUDED.meaning_vi, phonetic = EXCLUDED.phonetic, example_sentence = EXCLUDED.example_sentence, example_translation = EXCLUDED.example_translation;\n`;
    });
  });
});

sql += `\n-- 4. SEED 12 THEMED SONGS\n`;
data.topics.forEach(t => {
  if (t.song) {
    const songId = `song_${t.id}`;
    const lyricsJson = JSON.stringify(t.song.lines || []);
    const lyricsViJson = JSON.stringify(t.song.linesVi || []);
    sql += `INSERT INTO public.songs (id, topic_id, title, lyrics, lyrics_vi, duration_seconds, is_active)
VALUES (${escapeSql(songId)}, ${escapeSql(t.id)}, ${escapeSql(t.song.title)}, ${escapeSql(lyricsJson)}::jsonb, ${escapeSql(lyricsViJson)}::jsonb, 60, true)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, lyrics = EXCLUDED.lyrics, lyrics_vi = EXCLUDED.lyrics_vi;\n`;
  }
});

sql += `\n-- 5. SEED ACHIEVEMENTS\n`;
const achievements = [
  { id: 'first_word', title: 'Bước Chân Đầu Tiên', desc: 'Bé hoàn thành bài học từ vựng đầu tiên cùng Dino', icon: '🐾' },
  { id: 'streak_3', title: 'Chiến Binh Chăm Chỉ', desc: 'Học liên tục 3 ngày không nghỉ', icon: '🔥' },
  { id: 'star_50', title: 'Ngôi Sao Sáng', desc: 'Thu thập 50 ngôi sao vàng lấp lánh', icon: '⭐' },
  { id: 'topic_master', title: 'Thạc Sĩ Động Vật', desc: 'Hoàn thành trọn vẹn 10 bài học chủ đề Con vật', icon: '🦁' },
  { id: 'dino_level_5', title: 'Dino Trưởng Thành', desc: 'Đưa Dino tiến hóa lên Cấp độ 5', icon: '🦖' }
];

achievements.forEach(a => {
  sql += `INSERT INTO public.achievements (id, title, description, icon_url)
VALUES (${escapeSql(a.id)}, ${escapeSql(a.title)}, ${escapeSql(a.desc)}, ${escapeSql(a.icon)})
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description, icon_url = EXCLUDED.icon_url;\n`;
});

sql += `\nCOMMIT;\n`;

fs.writeFileSync(outSqlPath, sql, 'utf-8');
console.log(`Successfully generated SQL seed at: ${outSqlPath}`);
console.log(`Statistics: ${data.topics.length} topics, ${totalLessons} lessons, ${totalWords} vocabulary words.`);

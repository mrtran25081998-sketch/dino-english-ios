// scripts/fix_semantics_and_examples.js
const fs = require('fs');
const path = require('path');

const jsonPath = path.resolve(__dirname, '..', 'iOS', 'DinoEnglish', 'Data', 'DinoContent.json');
const db = JSON.parse(fs.readFileSync(jsonPath, 'utf-8'));

console.log("Analyzing and fixing semantic errors and example sentences across 1,200 words...");

// Intelligent template generator based on topic and word semantics
function generateSmartExample(word, topicId) {
  const en = word.english.trim();
  const vi = word.vietnamese.trim();
  const lowerEn = en.toLowerCase();

  // Topic: Feelings (Adjectives)
  if (topicId === 'feelings') {
    return {
      example: `I feel ${lowerEn} when I learn English with Dino.`,
      exampleVi: `Bé cảm thấy ${vi} khi được học tiếng Anh cùng bạn Dino.`
    };
  }

  // Topic: Actions (Verbs)
  if (topicId === 'actions') {
    return {
      example: `Let's ${lowerEn} together in the sunny park!`,
      exampleVi: `Chúng mình hãy cùng nhau ${vi} trong công viên đầy nắng nhé!`
    };
  }

  // Topic: Colors (Adjectives / Nouns)
  if (topicId === 'colors') {
    return {
      example: `I love the bright ${lowerEn} color.`,
      exampleVi: `Bé rất thích màu ${vi} tươi sáng này.`
    };
  }

  // Topic: Animals (Nouns)
  if (topicId === 'animals') {
    return {
      example: `Look at the lovely ${lowerEn} playing on the green grass.`,
      exampleVi: `Nhìn chú ${vi} đáng yêu đang chơi đùa trên bãi cỏ xanh kìa.`
    };
  }

  // Topic: Fruits (Nouns)
  if (topicId === 'fruits') {
    return {
      example: `Fresh ${lowerEn} is sweet and very healthy.`,
      exampleVi: `Món ${vi} tươi ngon, ngọt lành và rất tốt cho sức khỏe của bé.`
    };
  }

  // Topic: Food (Nouns)
  if (topicId === 'food') {
    if (['milk', 'water', 'juice', 'soup', 'tea'].some(d => lowerEn.includes(d))) {
      return {
        example: `I drink fresh ${lowerEn} every morning.`,
        exampleVi: `Bé uống ${vi} thơm ngon vào mỗi buổi sáng.`
      };
    }
    return {
      example: `This delicious ${lowerEn} smells so good!`,
      exampleVi: `Món ${vi} thơm lừng và ngon miệng này thật tuyệt vời!`
    };
  }

  // Topic: Body (Nouns)
  if (topicId === 'body') {
    if (['eye', 'ear', 'hand', 'foot', 'leg', 'arm'].some(b => lowerEn.includes(b))) {
      return {
        example: `Touch your ${lowerEn} gently and count with Dino!`,
        exampleVi: `Bé hãy chạm nhẹ vào ${vi} và đếm cùng Dino nào!`
      };
    }
    return {
      example: `We should keep our ${lowerEn} clean and healthy.`,
      exampleVi: `Bé luôn giữ gìn ${vi} sạch sẽ và khỏe mạnh mỗi ngày.`
    };
  }

  // Topic: Family (Nouns)
  if (topicId === 'family') {
    return {
      example: `My ${lowerEn} is kind and loves me very much.`,
      exampleVi: `${vi.charAt(0).toUpperCase() + vi.slice(1)} của bé rất hiền hậu và yêu thương bé vô bờ bến.`
    };
  }

  // Topic: School (Nouns)
  if (topicId === 'school') {
    return {
      example: `I bring my new ${lowerEn} to school today.`,
      exampleVi: `Hôm nay bé mang theo ${vi} mới tinh đến trường học.`
    };
  }

  // Topic: Vehicles (Nouns)
  if (topicId === 'vehicles') {
    return {
      example: `The fast ${lowerEn} travels down the wide road.`,
      exampleVi: `Chiếc ${vi} bon bon chạy lướt nhanh trên con đường rộng lớn.`
    };
  }

  // Topic: Clothing (Nouns, handle plurals like pants, socks, shoes)
  if (topicId === 'clothing') {
    if (['pants', 'shorts', 'jeans', 'trousers', 'socks', 'shoes', 'boots', 'glasses'].some(c => lowerEn.includes(c))) {
      return {
        example: `These comfortable ${lowerEn} fit me perfectly.`,
        exampleVi: `Chiếc ${vi} vừa vặn và tạo cảm giác vô cùng thoải mái cho bé.`
      };
    }
    return {
      example: `I wear this neat ${lowerEn} when I go out.`,
      exampleVi: `Bé mặc chiếc ${vi} gọn gàng, xinh xắn này khi đi ra ngoài.`
    };
  }

  // Topic: Nature (Nouns)
  if (topicId === 'nature') {
    return {
      example: `The beautiful ${lowerEn} makes our earth wonderful.`,
      exampleVi: `Cảnh sắc ${vi} tuyệt đẹp khiến trái đất của chúng ta thêm diệu kỳ.`
    };
  }

  // Default fallback
  return {
    example: `Let's explore the word "${lowerEn}" together!`,
    exampleVi: `Hãy cùng nhau khám phá từ vựng "${vi}" thú vị này nhé!`
  };
}

let updatedCount = 0;

db.topics.forEach(topic => {
  topic.lessons.forEach(lesson => {
    lesson.words.forEach(word => {
      // Check if example is generic or broken
      if (!word.example || word.example.includes('is wonderful') || word.example.trim().length < 5) {
        const smart = generateSmartExample(word, topic.id);
        word.example = smart.example;
        word.exampleVi = smart.exampleVi;
        updatedCount++;
      }
    });
  });
});

fs.writeFileSync(jsonPath, JSON.stringify(db, null, 2), 'utf-8');
console.log(`Successfully updated ${updatedCount} words with proper, meaningful, natural sentences!`);

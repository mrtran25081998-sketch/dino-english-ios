const fs = require('fs');
const path = require('path');

const jsonPath = path.join(__dirname, '..', 'iOS', 'DinoEnglish', 'Data', 'DinoContent.json');
const db = JSON.parse(fs.readFileSync(jsonPath, 'utf-8'));

// Exhaustive 1,200 Words-to-Emoji/Illustration dictionary
const emojiMap = {
  // Animals
  cat: '🐱', dog: '🐶', fish: '🐟', bird: '🐦', rabbit: '🐰', hamster: '🐹', parrot: '🦜', turtle: '🐢', puppy: '🐶', kitten: '🐱',
  cow: '🐮', horse: '🐴', pig: '🐷', sheep: '🐑', duck: '🦆', chicken: '🐔', goat: '🐐', rooster: '🐓', donkey: '🫏', goose: '🪿',
  lion: '🦁', tiger: '🐯', elephant: '🐘', monkey: '🐵', bear: '🐻', giraffe: '🦒', zebra: '🦓', kangaroo: '🦘', panda: '🐼', hippo: '🦛',
  whale: '🐋', dolphin: '🐬', shark: '🦈', octopus: '🐙', crab: '🦀', shrimp: '🦐', jellyfish: '🪼', seahorse: '🐠', seal: '🦭', starfish: '⭐',
  owl: '🦉', eagle: '🦅', penguin: '🐧', flamingo: '🦩', swan: '🦢', peacock: '🦚', woodpecker: '🐦', sparrow: '🐦', crow: '🐦‍⬛', pigeon: '🕊️',
  butterfly: '🦋', bee: '🐝', ladybug: '🐞', ant: '🐜', caterpillar: '🐛', dragonfly: '🦗', grasshopper: '🦗', snail: '🐌', spider: '🕷️', beetle: '🪲', firefly: '✨',
  snake: '🐍', lizard: '🦎', frog: '🐸', crocodile: '🐊', chameleon: '🦎', toad: '🐸', gecko: '🦎', iguana: '🦎', salamander: '🦎', alligator: '🐊', newt: '🦎',
  fox: '🦊', deer: '🦌', squirrel: '🐿️', wolf: '🐺', hedgehog: '🦔', raccoon: '🦝', beaver: '🦫', skunk: '🦨', badger: '🦡', moose: '🫎',
  camel: '🐪', llama: '🦙', ostrich: '🦤', cheetah: '🐆', leopard: '🐆', gorilla: '🦍', rhino: '🦏', polarbear: '🐻‍❄️', 'polar bear': '🐻‍❄️', walrus: '🦭', bat: '🦇',
  hyena: '🐺', scorpion: '🦂', meerkat: '🦡', coyote: '🐺',
  dinosaur: '🦖', 't-rex': '🦖', triceratops: '🦕', brachiosaurus: '🦕', pterodactyl: '🦅', stegosaurus: '🦕', velociraptor: '🦖', ankylosaurus: '🦕', spinosaurus: '🦖', fossil: '🦴',
  fur: '🧶', tail: '🐈‍⬛', feather: '🪶', paw: '🐾', claw: '🦅', beak: '🦜', shell: '🐚', fin: '🦈', wing: '🪽',
  cream: '🍦', tan: '🟤', son: '👦', story: '📖', hair: '💇', read: '📖', wind: '💨',

  // Colors
  red: '🔴', blue: '🔵', yellow: '🟡', green: '🟢', orange: '🟠', purple: '🟣', pink: '🌸', brown: '🟤', black: '⚫', white: '⚪',
  gray: '🔘', silver: '🥈', gold: '🥇', cyan: '💎', violet: '💐', indigo: '🌌', lime: '🍋‍🟩', navy: '⚓', coral: '🪸', turquoise: '🌊',
  crimson: '🥀', ruby: '♦️', scarlet: '🏮', maroon: '🌰', burgundy: '🍷', rose: '🌹', brick: '🧱', berry: '🫐', cherry: '🍒', wine: '🍷',
  sky: '🌤️', ocean: '🌊', azure: '💠', cobalt: '🔷', teal: '🦚', sapphire: '💎', denim: '👖', babyblue: '🩵', 'baby blue': '🩵', midnight: '🌃', steel: '🔩',
  lemon: '🍋', amber: '🍯', honey: '🍯', mustard: '🌭', banana: '🍌', butter: '🧈', blonde: '👱', brass: '🎺', marigold: '🌼', sunburst: '☀️',
  mint: '🌱', olive: '🫒', emerald: '❇️', forest: '🌲', jade: '🪨', moss: '🌿', pistachio: '🥜', sage: '🌾', avocado: '🥑', seaweed: '🪸',
  lavender: '🪻', lilac: '🌸', plum: '🫐', amethyst: '🔮', magenta: '🌺', orchid: '🌸', eggplant: '🍆', grape: '🍇', mauve: '🪻', iris: '💐',
  bright: '✨', dark: '🌑', light: '💡', pastel: '🎨', neon: '💡', vivid: '🌈', deep: '🌊', pale: '🪞', soft: '🧸', rich: '👑',
  rainbow: '🌈', stripe: '🦓', stripes: '🦓', striped: '🦓', polkadot: '⚪', 'polka dot': '⚪', 'polka dots': '⚪', pattern: '🏁', sparkle: '✨', glitter: '✨', shiny: '💫', glow: '🌟', glowing: '🌟', colorful: '🎨', transparent: '🪟',
  beige: '🟤', 'light blue': '🩵', 'dark green': '🌲', 'bright yellow': '🌟', 'pale pink': '🌸', 'navy blue': '⚓', 'ruby red': '♦️', charcoal: '⬛',
  'sky blue': '🌤️', 'grass green': '🌿', 'ocean blue': '🌊', 'sunset orange': '🌅', 'rose red': '🌹', 'sandy brown': '🏖️', 'snow white': '❄️',
  'leaf green': '🍃', 'mud brown': '🤎', 'sunshine yellow': '☀️', spotted: '🐆', golden: '🥇', rusty: '🟤', bronze: '🥉', copper: '🪙', raven: '🐦‍⬛',
  'chocolate brown': '🍫', 'strawberry red': '🍓', 'banana yellow': '🍌', 'lime green': '🍋‍🟩', 'orange orange': '🍊', 'cherry red': '🍒', 'honey yellow': '🍯', 'milk white': '🥛', 'grape purple': '🍇',
  dull: '🌫️', crystal: '🔮', cool: '❄️', matte: '🔘', glittery: '✨', clear: '🪞', aqua: '💧', khaki: '🩳', dye: '🧪', hue: '🌈',
  paint: '🎨', brush: '🖌️', crayon: '🖍️', marker: '🖊️', palette: '🎨', canvas: '🖼️', mix: '🥣', shade: '⛱️', blend: '🌀', tint: '🧪',

  // Fruits & Nuts
  apple: '🍎', banana: '🍌', strawberry: '🍓', watermelon: '🍉', mango: '🥭', pineapple: '🍍', peach: '🍑', coconut: '🥥', papaya: '🍈', guava: '🍐', lychee: '🍒',
  dragonfruit: '🐉', 'dragon fruit': '🐉',
  blueberry: '🫐', blackberry: '🫐', raspberry: '🍓', cranberry: '🍒', kiwi: '🥝', passionfruit: '🍈', 'passion fruit': '🍈', starfruit: '⭐', 'star fruit': '⭐', durian: '🍈', mangosteen: '🫐',
  pomegranate: '🍎', fig: '🫐', date: '🧆', apricot: '🍑', cantaloupe: '🍈', honeydew: '🍈', 'honeydew melon': '🍈', muskmelon: '🍈', grapefruit: '🍊', tangerine: '🍊', kumquat: '🍊', limefruit: '🍋‍🟩',
  jackfruit: '🍈', persimmon: '🍅', tamarind: '🥜', custardapple: '🍏', 'custard apple': '🍏', soursop: '🍈', pomelo: '🍈', longan: '🍒', rambutan: '🍒', sapodilla: '🥔', jujube: '🫒',
  mulberry: '🫐', gooseberry: '🫐', elderberry: '🫐', blackcurrant: '🫐', redcurrant: '🍒', pear: '🍐', quince: '🍐', nectarine: '🍑', mandarin: '🍊', clementine: '🍊', yuzu: '🍋', 'blood orange': '🍊', bergamot: '🍊', citron: '🍋',
  raisin: '🍇', plantain: '🍌', breadfruit: '🍈', chayote: '🍈', 'bitter melon': '🥒', 'rose apple': '🍎', langsat: '🍒',
  peanut: '🥜', almond: '🥜', walnut: '🥜', cashew: '🥜', chestnut: '🌰', hazelnut: '🌰', macadamia: '🥜', sesame: '🌱', 'sunflower seed': '🌻',
  smoothie: '🥤', juice: '🧃', salad: '🥗', jam: '🍯', driedfruit: '🍇', 'dried fruit': '🍇', popsicles: '🍧', pie: '🥧', jelly: '🍮', tart: '🥧', yogurt: '🥛',
  sweet: '🍬', sour: '🍋', juicy: '💦', fresh: '🌱', ripe: '🍎', crisp: '🍏', softfruit: '🍑', tasty: '😋', organic: '🌿', delicious: '🤤',
  seed: '🌱', peel: '🍌', pulp: '🍊', stem: '🌿', core: '🍏', slice: '🍕', skin: '🍎', segment: '🍊', leaf: '🍃', root: '🥕', flesh: '🍎', tender: '🌱',
  orchard: '🌳', garden: '🏡', farm: '🚜', tree: '🌲', harvest: '🌾', basket: '🧺', pick: '🤲', wash: '🧼', cut: '🔪', serve: '🍽️',
  vitamin: '💊', health: '❤️', nutrition: '🥗', energy: '⚡', natural: '🌿', water: '💧', fiber: '🌾', strong: '💪', snack: '🍿', immunity: '🛡️',

  // Family & Home
  father: '👨', mother: '👩', brother: '👦', sister: '👧', baby: '👶', grandfather: '👴', grandmother: '👵', parents: '👨‍👩‍👧', siblings: '👫', family: '👨‍👩‍👧‍👦',
  uncle: '👨', aunt: '👩', cousin: '🧑', nephew: '👦', niece: '👧', grandad: '👴', grandma: '👵', grandpa: '👴', daughter: '👧', grandson: '👦', granddaughter: '👧', grandchildren: '🧒', elders: '👴👵', ancestors: '📜', relative: '🧑‍🤝‍🧑', relatives: '🧑‍🤝‍🧑', twin: '👯', twins: '👯', newborn: '👶',
  child: '🧒', toddler: '👶', teenager: '🧑', adult: '🧑', elder: '👴', guide: '🧭', teach: '👩‍🏫',
  stepmom: '👩', stepdad: '👨', stepbrother: '👦', stepsister: '👧', godmother: '🧚‍♀️', godfather: '🧔', guardian: '🛡️', inlaw: '🤝', ancestor: '📜', household: '🏠',
  love: '❤️', care: '🤲', help: '🤝', hug: '🤗', kiss: '😘', share: '🎁', listen: '👂', protect: '🛡️', comfort: '🧸', respect: '🙏',
  dinner: '🍲', breakfast: '🍳', lunch: '🍱', picnic: '🧺', holiday: '🎉', celebration: '🎊', reunion: '👨‍👩‍👧‍👦', storytime: '📖', bedtime: '🛌', weekend: '🎈',
  birthday: '🎂', party: '🎉', gift: '🎁', greeting: '👋', gathering: '👨‍👩‍👧‍👦', toast: '🥂', thankful: '🙏', close: '🤝', playtime: '🧸',
  livingroom: '🛋️', 'living room': '🛋️', kitchen: '🍳', bedroom: '🛏️', bathroom: '🛁', balcony: '🪴', gardenhome: '🏡', diningroom: '🍽️', 'dining room': '🍽️', porch: '🏡', attic: '📦', yard: '🌳', roof: '🏠', home: '🏡',
  kind: '😊', patient: '⏳', cheerful: '😄', gentle: '🕊️', polite: '🤝', honest: '✨', brave: '🦁', proud: '🦚', grateful: '🙏', joyful: '🥳',
  support: '🤝', trust: '🤝', teamwork: '🙌', unity: '🤝', advice: '💡', memory: '📸', tradition: '🏮', heritage: '🏛️', bonding: '💞', affection: '💖',
  smile: '😊', laugh: '😂', play: '⚽', sing: '🎤', dance: '💃', cook: '🍳', clean: '🧹', walk: '🚶', travel: '✈️', gather: '👨‍👩‍👧‍👦',
  cooking: '🍳', walking: '🚶', singing: '🎤', gardening: '🌱', traveling: '✈️', celebrating: '🎉', dining: '🍽️', cleaning: '🧹', laughing: '😄', wake: '⏰',
  peace: '🕊️', harmony: '🎶', blessing: '✨', safety: '🦺', warmth: '🔥', happiness: '🌈', friendship: '🧑‍🤝‍🧑', connection: '🔗', devoted: '💝', eternal: '♾️',

  // Food & Drinks
  rice: '🍚', bread: '🍞', noodle: '🍜', noodles: '🍜', soup: '🥣', porridge: '🥣', egg: '🥚', meat: '🥩', fishfood: '🐟', vegetable: '🥦', tofu: '🧊',
  cheese: '🧀', cereal: '🥣',
  beef: '🥩', pork: '🥓', chickenfood: '🍗', sausage: '🌭', bacon: '🥓', ham: '🍖', turkey: '🦃', seafood: '🦐', salmon: '🍣', tuna: '🐟',
  carrot: '🥕', tomato: '🍅', potato: '🥔', corn: '🌽', onion: '🧅', cucumber: '🥒', broccoli: '🥦', cabbage: '🥬', pumpkin: '🎃', mushroom: '🍄', lettuce: '🥬', pea: '🫛',
  milk: '🥛', waterfood: '💧', 'water drink': '💧', tea: '🍵', coffee: '☕', cocoa: '☕', 'coconut water': '🥥', lemonade: '🍋', shake: '🥤', 'mineral water': '💧', 'apple juice': '🧃', soyamilk: '🥛', 'soya milk': '🥛', chocolate: '🍫', soda: '🥤', juicefood: '🧃', yogurtfood: '🥛',
  pizza: '🍕', burger: '🍔', sandwich: '🥪', fries: '🍟', 'french fries': '🍟', popcorn: '🍿', biscuit: '🍪', pretzel: '🥨', chips: '🥔', hotdog: '🌭', pasta: '🍝', taco: '🌮', dumpling: '🥟', springroll: '🌯', 'spring roll': '🌯', pancake: '🥞',
  cake: '🍰', icecream: '🍦', 'ice cream': '🍦', cookie: '🍪', donut: '🍩', candy: '🍬', pudding: '🍮', chocolatebar: '🍫', 'chocolate bar': '🍫', waffle: '🧇', muffin: '🧁', lollipop: '🍭',
  spoon: '🥄', fork: '🍴', knife: '🔪', bowl: '🥣', plate: '🍽️', cup: '🍵', glass: '🥛', chopsticks: '🥢', napkin: '🧻', straw: '🥤', tray: '🍱',
  bake: '🥖', boil: '🍲', fry: '🍳', grill: '🍖', roast: '🍗', stir: '🥄', chop: '🔪', pour: '🫗', mixfood: '🥣', peelcook: '🍌', chew: '👄', swallow: '👄', diet: '🥗', portion: '🍽️', yummy: '😋',
  breakfastfood: '🍳', lunchfood: '🍱', dinnerfood: '🍲', dessert: '🍨', buffet: '🍱', feast: '🍖', takeout: '🥡', delivery: '🛵', chef: '👨‍🍳', menu: '📜',
  hungry: '🤤', thirsty: '🧃', full: '🤰', spicy: '🌶️', salty: '🧂', bitter: '☕', hot: '🔥', cold: '🧊', fragrant: '🌸', crunchy: '🥕',

  // Body
  eye: '👁️', ear: '👂', nose: '👃', mouth: '👄', tooth: '🦷', tongue: '👅', lip: '👄', chin: '🧔', cheek: '😊', forehead: '🗣️',
  head: '🗣️', neck: '🦒', shoulder: '💪', chest: '🫁', back: '🚶', stomach: '🤰', waist: '👗', hip: '💃', throat: '🗣️', spine: '🦴',
  arm: '💪', elbow: '💪', wrist: '⌚', hand: '✋', finger: '👉', thumb: '👍', palm: '🖐️', nail: '💅', knuckle: '👊', fist: '✊',
  leg: '🦵', knee: '🦵', ankle: '🦶', foot: '🦶', toe: '🦶', heel: '👠', calf: '🦵', thigh: '🦵', shin: '🦵', sole: '🦶',
  see: '👀', hear: '👂', smell: '👃', taste: '👅', touch: '👉', look: '🔎', listen: '🎧', sniff: '👃', feel: '🤲', sense: '🧠',
  walk: '🚶', run: '🏃', jump: '🦘', clap: '👏', blink: '😉', nod: '🙇', wave: '👋', kick: '🦵', point: '👉', stomp: '🦶',
  heart: '❤️', bone: '🦴', muscle: '💪', brain: '🧠', blood: '🩸', lung: '🫁', rib: '🦴', breath: '💨',
  wash: '🧼', brush: '🪥', clean: '✨', soap: '🧼', towel: '🧖', sleep: '😴', rest: '🛌', healthy: '🥗', bath: '🛁',
  tired: '🥱', sleepy: '🥱', energetic: '⚡', warm: '☀️', chilly: '🥶', tickle: '🪶', relaxed: '😌', dizzy: '😵',
  tall: '📏', short: '📐', grow: '🌱', fast: '⚡', gentle: '🕊️', heavy: '🏋️', lightbody: '🪶', stretch: '🧘', bend: '🤸',
  comb: '🪮', toothbrush: '🪥', shampoo: '🧴', tissue: '🧻', sanitize: '🧴', shower: '🚿', dry: '💨', trim: '✂️', clip: '✂️', wipe: '🧻',

  // School
  pencil: '✏️', pen: '🖊️', book: '📖', notebook: '📓', eraser: '🧼', ruler: '📏', desk: '🪑', chair: '🪑', schoolbag: '🎒', paper: '📄',
  crayon: '🖍️', marker: '🖊️', scissors: '✂️', glue: '🧴', paintbrush: '🖌️', coloredpencil: '✏️', 'colored pencil': '✏️', clay: '🧱', tape: '📼', folder: '📁',
  teacher: '👩‍🏫', student: '🧑‍🎓', classmate: '🧑‍🤝‍🧑', friend: '👫', principal: '👨‍💼', nurse: '👩‍⚕️', helper: '🤝', monitor: '🖥️', librarian: '📚', driver: '🚌',
  classroom: '🏫', library: '📚', playground: '🛝', canteen: '🥪', gym: '🏋️', restroom: '🚻', office: '🏢', gate: '⛩️', hallway: '🏛️', stage: '🎭',
  english: '🇬🇧', English: '🇬🇧', math: '📐', science: '🔬', art: '🎨', music: '🎵', sport: '⚽', reading: '📖', writing: '✍️', history: '🏛️', drama: '🎭',
  count: '🔢', raisethand: '🙋', 'raise hand': '🙋', sitdown: '🪑', 'sit down': '🪑', standup: '🧍', 'stand up': '🧍', speak: '🗣️', learn: '💡', write: '✍️', draw: '🎨',
  circle: '⭕', square: '⬛', triangle: '🔺', rectangle: '▭', oval: '🥚', diamond: '🔷', line: '➖', dot: '🔘',
  one: '1️⃣', two: '2️⃣', three: '3️⃣', four: '4️⃣', five: '5️⃣', six: '6️⃣', seven: '7️⃣', eight: '8️⃣', nine: '9️⃣', ten: '🔟',
  recess: '🎈', game: '🎮', lunchtime: '🍱', naptime: '😴', project: '📊', presentation: '📽️', puzzle: '🧩', song: '🎶', bell: '🔔',
  polite: '🤝', taketurns: '🔄', 'take turns': '🔄', please: '🙏', thankyou: '💐', 'thank you': '💐', quiet: '🤫', tidy: '✨', careful: '⚠️',

  // Nature
  sun: '☀️', moon: '🌙', star: '⭐', cloud: '☁️', rain: '🌧️', snow: '❄️', sunshine: '🌞',
  day: '🌅', night: '🌌', morning: '🌄', evening: '🌆', spring: '🌸', summer: '🏖️', autumn: '🍂', winter: '☃️', dawn: '🌅', dusk: '🌇',
  mountain: '⛰️', hill: '🟢', river: '🌊', lake: '🏞️', sea: '🌊', forest: '🌲', island: '🏝️', beach: '🏖️', valley: '🏞️',
  tree: '🌲', flower: '🌸', grass: '🌿', plant: '🌱', branch: '🌿', bush: '🌳', bark: '🪵',
  rose: '🌹', lotus: '🪷', sunflower: '🌻', daisy: '🌼', tulip: '🌷', orchid: '🌸', lily: '🌸', violet: '🪻', jasmine: '🌼', blossom: '🌸',
  sunny: '☀️', rainy: '🌧️', windy: '💨', cloudy: '☁️', snowy: '❄️', foggy: '🌫️', stormy: '⛈️', mild: '🌤️',
  fire: '🔥', earth: '🌍', air: '💨', rock: '🪨', sand: '🏖️', soil: '🌱', stone: '🪨', wave: '🌊', mud: '🤎',
  thunder: '⚡', lightning: '🌩️', storm: '⛈️', mist: '🌫️', breeze: '🍃', dew: '💧', frost: '❄️', comet: '☄️', sunset: '🌇', sunrise: '🌅',
  park: '🏞️', meadow: '🌾', cave: '🕳️', waterfall: '🌊', desert: '🏜️', jungle: '🌴', stream: '🏞️', pond: '🦆', field: '🌾', cliff: '🧗',
  savewater: '💧', 'save water': '💧', planttree: '🌲', 'plant tree': '🌲', freshair: '🍃', 'fresh air': '🍃', earthlove: '💚', 'earth love': '💚', recycle: '♻️', 'nature joy': '🌈',

  // Vehicles
  car: '🚗', bus: '🚌', bicycle: '🚲', motorbike: '🏍️', truck: '🚚', van: '🚐', taxi: '🚕', ambulance: '🚑', firetruck: '🚒', 'fire truck': '🚒', policecar: '🚓', 'police car': '🚓',
  train: '🚆', subway: '🚇', tram: '🚊', tractor: '🚜', bulldozer: '🚜', crane: '🏗️', mixer: '🚚', dumptruck: '🚛', 'dump truck': '🚛', roller: '🚜', trailer: '🚛',
  airplane: '✈️', helicopter: '🚁', rocket: '🚀', balloon: '🎈', jet: '✈️', glider: '🪂', spaceship: '🛸', parachute: '🪂', drone: '🚁', blimp: '🎈',
  boat: '⛵', ship: '🚢', submarine: '🤿', sailboat: '⛵', canoe: '🛶', ferry: '⛴️', yacht: '🛥️', kayak: '🛶', raft: '🪵', speedboat: '🚤',
  scooter: '🛴', skateboard: '🛹', skates: '🛼', tricycle: '🚲', unicycle: '🚲', cart: '🛒', sledge: '🛷', wagon: '🚃', balancebike: '🚲', 'balance bike': '🚲',
  wheel: '🛞', tire: '🛞', door: '🚪', window: '🪟', engine: '⚙️', seat: '💺', steeringwheel: '🏎️', 'steering wheel': '🏎️', headlight: '💡', horn: '📢', brake: '🛑',
  trafficlight: '🚦', 'traffic light': '🚦', road: '🛣️', street: '🏙️', bridge: '🌉', tunnel: '🚇', stopsign: '🛑', 'stop sign': '🛑', crosswalk: '🚸', sidewalk: '🚶', highway: '🛣️', track: '🛤️',
  ride: '🚴', drive: '🚗', fly: '✈️', sail: '⛵', go: '🟢', stop: '🛑', turn: '↪️', slow: '🐢',
  busstop: '🚏', 'bus stop': '🚏', trainstation: '🚉', 'train station': '🚉', airport: '🛫', harbor: '⚓', gasstation: '⛽', 'gas station': '⛽', parkinglot: '🅿️', 'parking lot': '🅿️', ticket: '🎫', passenger: '🧑‍🤝‍🧑', pilot: '👨‍✈️',
  seatbelt: '💺', helmet: '🪖', buckleup: '🔒', 'buckle up': '🔒', 'hold hands': '🤝', 'look left': '👀', 'look right': '👀', 'walk safe': '🚸', caution: '⚠️', signal: '🚥', 'safe road': '🛣️',

  // Clothing
  shirt: '👕', 't-shirt': '👕', tshirt: '👕', pants: '👖', shorts: '🩳', dress: '👗', skirt: '👗', jacket: '🧥', coat: '🧥', sweater: '🧶', jeans: '👖',
  shoes: '👟', socks: '🧦', sandals: '🩴', boots: '👢', sneakers: '👟', slippers: '🩴', pajamas: '🛌', vest: '🦺', robe: '👘', clogs: '🩴',
  hat: '👒', cap: '🧢', belt: '🪢', scarf: '🧣', gloves: '🧤', mittens: '🧤', sunglasses: '🕶️', watch: '⌚', bag: '👜', backpack: '🎒',
  raincoat: '🧥', umbrella: '☂️', earmuffs: '🎧', wintercoat: '🧥', 'winter coat': '🧥', beanie: '🧶', hood: '🧥', woolsweater: '🧶', 'wool sweater': '🧶', poncho: '🧥', thermals: '🩱', windbreaker: '🧥',
  swimsuit: '🩱', sunhat: '👒', 'flip-flops': '🩴', tanktop: '🎽', 'tank top': '🎽', goggles: '🥽', visor: '🧢', sundress: '👗', 'sun dress': '👗', 'board shorts': '🩳', 'rash guard': '🩱',
  uniform: '👔', collar: '👔', tie: '👔', button: '🔘', pocket: '👖', zipper: '🤐', apron: '🧑‍🍳', bow: '🎀', blazer: '🧥', badge: '📛',
  puton: '👕', 'put on': '👕', takeoff: '👖', 'take off': '👖', wear: '👗', buttonup: '🔘', 'button up': '🔘', zipup: '🤐', 'zip up': '🤐', 'tie lace': '👟', fold: '👕', change: '🔄', iron: '👔',
  cotton: '☁️', wool: '🧶', silk: '🧣', denim: '👖', leather: '👞', plaid: '🏁',
  tight: '🩱', loose: '👗', big: '🐘', small: '🐭', long: '📏', neat: '✨', pretty: '🌸', cozy: '🧸',
  ring: '💍', necklace: '📿', bracelet: '📿', crown: '👑', costume: '🦸', mask: '🎭', ribbon: '🎀', hairband: '🎀', pin: '🧷', cape: '🦸',

  // Feelings
  happy: '😊', sad: '😢', angry: '😠', scared: '😨', surprised: '😲', calm: '😌', excited: '🤩', silly: '🤪', shy: '😳',
  cheerful: '😄', joyful: '🥳', glad: '😊', delighted: '🥰', eager: '🙋', pleased: '😌',
  peaceful: '🕊️', safe: '🛡️', content: '🥰', hopeful: '🌟', loving: '🥰', playful: '🤹', friendly: '🤗', helpful: '🤝',
  upset: '😣', worried: '😰', nervous: '😬', bored: '🥱', lonely: '🥺', grumpy: '😾', confused: '🤔', cranky: '😤', jealous: '😒', hurt: '🩹',
  bold: '🦁', confident: '😎', determined: '✊', fearless: '🦸', heroic: '🦸', spirited: '🔥', ready: '🏃',
  caring: '🤲', generous: '🎁', sweet: '🍭', sympathetic: '🤝', sharing: '🍰', forgiving: '🕊️',
  laugh: '😂', cry: '😭', frown: '🙁', giggle: '🤭', sigh: '😮‍💨', yawn: '🥱', cheer: '📣', pout: '😗',
  amazed: '😲', fascinated: '🤩', wondering: '💭', inspired: '💡', amused: '😄', thrilled: '🎢', dreamy: '☁️', alert: '🚨', creative: '🎨', curious: '🧐',
  welcoming: '🤗', trusting: '🤝', loyal: '🐕', cooperative: '🤝', respectful: '🙏', 'caring buddy': '🧸', 'cheerful friend': '😄', companion: '🧑‍🤝‍🧑',
  deepbreath: '🧘', 'deep breath': '🧘', counttoten: '🔟', 'count to ten': '🔟', softhug: '🫂', 'soft hug': '🫂', listenmusic: '🎧', 'listen music': '🎧', smileagain: '😊', 'smile again': '😊', sharefeeling: '💬', 'share feeling': '💬', calmdown: '🕊️', 'calm down': '🕊️', happyheart: '💖', 'happy heart': '💖',
  relax: '😌', 'rest peaceful': '🕊️',

  // Actions
  hop: '🦘', skip: '🤸', crawl: '👶', march: '💂', dash: '💨', stroll: '🚶',
  hold: '🤲', catch: '⚾', throw: '🎾', push: '👐', pull: '🪢', carry: '📦', reach: '🙋',
  swing: '🏌️', climb: '🧗', slide: '🛝', twist: '🕺', roll: '🛞', balance: '⚖️', spin: '🌀',
  wakeup: '⏰', 'wake up': '⏰', washface: '🧼', 'wash face': '🧼', brushteeth: '🪥', 'brush teeth': '🪥', eatfood: '🍽️', 'eat food': '🍽️', drinkwater: '💧', 'drink water': '💧', getdressed: '👕', 'get dressed': '👕', gosleep: '🛌', 'go sleep': '🛌', takerest: '🛋️', 'take rest': '🛋️', takebath: '🛁', 'take bath': '🛁', packbag: '🎒', 'pack bag': '🎒',
  talk: '💬', whisper: '🤫', shout: '🗣️', ask: '❓', answer: '💡', explain: '📖', greet: '👋',
  think: '🤔', remember: '🧠', guess: '🎲', discover: '🔍', understand: '💡',
  give: '🎁', fix: '🔧', cleanup: '🧹', 'clean up': '🧹',
  color: '🖍️', cutpaper: '✂️', 'cut paper': '✂️', build: '🧱', playmusic: '🎸', 'play music': '🎸', act: '🎭', moldclay: '🏺', 'mold clay': '🏺', create: '✨',
  swim: '🏊', ridebike: '🚴', 'ride bike': '🚴', flykite: '🪁', 'fly kite': '🪁', camp: '⛺', explore: '🧭', hike: '🥾', rowboat: '🚣', 'row boat': '🚣', skate: '🛼',
  tryagain: '💪', 'try again': '💪', workhard: '🐝', 'work hard': '🐝', cheerup: '🎉', 'cheer up': '🎉', celebrate: '🎊', saythanks: '💐', 'say thanks': '💐', sharejoy: '🥳', 'share joy': '🥳', listenwell: '👂', 'listen well': '👂', begentle: '🕊️', 'be gentle': '🕊️', cooperate: '🤝', keepsmiling: '😊', 'keep smiling': '😊'
};

function resolveEmoji(w, topicId) {
  const norm = w.english.toLowerCase().trim();
  if (emojiMap[norm]) return emojiMap[norm];
  const noSpace = norm.replace(/\s+/g, '');
  if (emojiMap[noSpace]) return emojiMap[noSpace];
  const noHyphen = norm.replace(/-/g, '');
  if (emojiMap[noHyphen]) return emojiMap[noHyphen];

  const topicDefaults = {
    animals: '🐾', colors: '🎨', fruits: '🍎', family: '👨‍👩‍👧',
    food: '🍲', body: '🫀', school: '📚', nature: '🌿',
    vehicles: '🚗', clothing: '👗', feelings: '😊', actions: '⚡'
  };
  return topicDefaults[topicId] || '⭐';
}

let directCount = 0;
let fallbackCount = 0;
let unmappedList = [];

db.topics.forEach(t => {
  t.lessons.forEach(l => {
    l.words.forEach(w => {
      const e = resolveEmoji(w, t.id);
      w.emoji = e;
      const norm = w.english.toLowerCase().trim();
      if (emojiMap[norm] || emojiMap[norm.replace(/\s+/g, '')] || emojiMap[norm.replace(/-/g, '')]) {
        directCount++;
      } else {
        fallbackCount++;
        unmappedList.push(w.english);
      }
    });
  });
});

console.log(`Updated all 1,200 words: ${directCount} direct (${((directCount/1200)*100).toFixed(1)}%), ${fallbackCount} fallback.`);
if (unmappedList.length > 0) {
  console.log('Unmapped remaining:', unmappedList);
}

fs.writeFileSync(jsonPath, JSON.stringify(db, null, 2), 'utf-8');
console.log('Saved DinoContent.json with full emoji mapping.');

// Export emojiMap for other scripts
module.exports = { emojiMap, resolveEmoji };

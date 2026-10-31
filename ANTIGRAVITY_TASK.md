# ANTIGRAVITY — DINO ENGLISH DEVELOPMENT BRIEF

You are continuing an existing native SwiftUI iOS project, not starting from scratch. Read `iOS/README.md`, open `iOS/DinoEnglish.xcodeproj`, inspect `iOS/DinoEnglish/DinoEnglishApp.swift` and `web-preview/DinoEnglish_3D_Preview.html` for UX reference.

## Product
Vietnamese-first English learning app for young children with a friendly 3D mint-green dinosaur Dino (yellow backpack). Preserve character likeness and style using the actual assets in `mascot-png/` and asset catalogs already placed in Xcode. Avoid emoji placeholder Dino in the production UI.

## Maintain original flow
Onboarding (3 screens) -> demo parental sign-in -> Home -> choose topic -> choose lesson -> choose activity: Vocabulary / Pronunciation / Picture Quiz / Songs -> Reward -> Dino evolution. Tabs: Home, Learn, Dino, Profile. Include 3D rounded pastel cards, yellow CTAs, accessible text sizes, VoiceOver labels and reduced-motion compatibility.

## Data requirements
- 12 subjects: Animals, Colors, Fruits, Family, Food, Body, School, Nature, Vehicles, Clothing, Feelings, Actions.
- Target: 100 editorially reviewed appropriate vocabulary items per subject, separated into 10 lessons x 10 words; **this target is not yet met by the starter data**. Avoid claiming 1,200 complete words until supplied/verified.
- Every word needs topicId, lessonId, stable id, English, Vietnamese, IPA (validated), illustration asset id, audio asset or system TTS fallback, age/difficulty tag. Correct mismatches between topic, card, quiz, voice and song.
- Avoid reusing one common five-word bank across topics. Quiz distractors must be from current lesson or suitably similar words within current topic; avoid duplicates.
- Content should be pedagogically appropriate; avoid advanced niche animals early. Child-friendly practice duration; no forced streak loss.

## Features
- SwiftUI native iOS 17+, AVSpeechSynthesizer text-to-speech.
- Speech framework for recognition only; do NOT fabricate pronunciation accuracy score. Explain recognition does not equal phonetic grading.
- Local persistent progress keyed by topicId/lessonId/wordId. Reward exactly once per activity and guard against reward farming; show review/repeat mode separately.
- 20 Dino evolution states: use provided real 3D art for existing stages and reuse safely for unillustrated levels; do not claim 20 unique images are present.
- Parent controls and age-sensitive UX; no direct child account with unsecured email/password login; demo mode clearly labeled.
- Songs in starter use spoken practice lines, not licensed recordings; implement actual songs only with proper audio assets/licenses.

## Engineering workflow
1. First run `xcodebuild -list -project iOS/DinoEnglish.xcodeproj` on Mac with Xcode, then build simulator and resolve compiler errors. This package was assembled outside macOS, so no successful Xcode build is claimed.
2. Refactor monolithic Swift file into Models/, Services/, ViewModels/, Views/, Components/, Data/; keep existing navigation functional during refactor.
3. Build an offline JSON content pipeline + validator for exact counts, uniqueness, topic coherence, IPA and image references.
4. Connect local progress, make end-to-end flows work, add unit tests and UI smoke tests.
5. Run on iPhone simulator, fix constraints, keyboard, accessibility, app lifecycle and audio permissions.
6. Prepare TestFlight checklist, data/privacy and parent-consent flow before production release.

## Design assets mapping
`welcome.png`: onboarding/login; `home.png`: home; `study.png`: vocabulary; `listen.png`: listening; `speak.png`: speaking; `game.png`: quiz; `song.png`: songs; `reward.png`/`clap.png`: success; `level1.png`–`level4.png`: major evolution milestones. Additional `think.png` is for hint states. PNGs were programmatically segmented; visually review edges/transparency and clean problematic assets before production.

## Deliverables required from Antigravity
- Correctly compiling .xcodeproj with all source and assets
- Screenshot of every major screen from Simulator
- Clearly specified content coverage per topic and level
- Report of build/test outcomes and any remaining blockers
- Native running app, not only HTML mockup

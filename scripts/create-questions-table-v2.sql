-- Drop the existing table if it exists (be careful in production!)
DROP TABLE IF EXISTS questions;

-- Create the questions table with separate columns for each age
CREATE TABLE questions (
  id BIGSERIAL PRIMARY KEY,
  question TEXT NOT NULL,
  icon_name TEXT NOT NULL DEFAULT 'help-circle',
  asked_by_age INTEGER NOT NULL CHECK (asked_by_age >= 2 AND asked_by_age <= 7),
  asked_date DATE NOT NULL,
  grownup_answer TEXT NOT NULL,
  kid_answer_age_2 TEXT NOT NULL,
  kid_answer_age_3 TEXT NOT NULL,
  kid_answer_age_4 TEXT NOT NULL,
  kid_answer_age_5 TEXT NOT NULL,
  kid_answer_age_6 TEXT NOT NULL,
  kid_answer_age_7 TEXT NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Create an index on created_at for ordering
CREATE INDEX idx_questions_created_at ON questions(created_at);

-- Create an index on asked_by_age for filtering
CREATE INDEX idx_questions_asked_by_age ON questions(asked_by_age);

-- Insert sample data with separate columns
INSERT INTO questions (
  question, 
  icon_name, 
  asked_by_age, 
  asked_date, 
  grownup_answer,
  kid_answer_age_2,
  kid_answer_age_3,
  kid_answer_age_4,
  kid_answer_age_5,
  kid_answer_age_6,
  kid_answer_age_7
) VALUES
(
  'Why is the sky blue?',
  'droplets',
  5,
  '2025-06-13',
  'The sky appears blue due to Rayleigh scattering. When sunlight enters Earth''s atmosphere, it collides with gas molecules. Blue light has a shorter wavelength and gets scattered more than other colors, making the sky appear blue to our eyes.',
  'Sky blue! Pretty blue up there!',
  'The sky is blue because the sun makes it blue! Like your blue shirt!',
  'Sunlight has lots of colors mixed together, but we see blue the most when we look up at the sky!',
  'The sky is blue because sunlight bounces off tiny pieces of air, and blue light bounces around more than other colors!',
  'The sky is blue because sunlight bounces around tiny pieces of air in a special way that makes us see blue color the most!',
  'The sky appears blue because of a scientific process called scattering. When sunlight hits tiny particles in our atmosphere, blue light waves get bounced around more than other colors, making the whole sky look blue to our eyes!'
),
(
  'Where do babies come from?',
  'baby',
  4,
  '2025-05-28',
  'Human reproduction involves the fertilization of an egg by sperm, leading to embryonic development in the uterus over approximately 9 months. The process involves complex biological mechanisms including conception, gestation, and birth.',
  'Baby in mommy''s tummy! Then baby comes out!',
  'Babies grow in mommy''s belly and then come out when they''re ready to meet you!',
  'Babies start very tiny in mommy''s tummy and grow bigger until they''re ready to be born!',
  'Babies grow in a special place in mommy''s tummy called a womb, and when they''re big enough, they come out!',
  'Babies grow in their mommy''s tummy in a special place called a womb. When they''re big enough and ready, they come out to meet their family!',
  'Babies develop from a tiny cell that grows in their mother''s uterus (womb). Over about 9 months, this cell develops into a fully formed baby with all their organs, and when they''re ready, they''re born!'
),
(
  'Why do we have to sleep?',
  'moon',
  3,
  '2025-07-02',
  'Sleep serves multiple critical functions including memory consolidation, cellular repair, immune system strengthening, and metabolic regulation. During sleep, the brain clears toxins and processes information from the day.',
  'Sleep makes you big and strong! Night night!',
  'We sleep so our bodies can rest and grow! Like how you charge your toys!',
  'Sleep helps your body rest and your brain remember all the fun things you did today!',
  'Sleep is like charging your body''s battery! Your brain cleans up and your body grows while you sleep!',
  'Sleep is like charging your body''s battery! While you sleep, your brain organizes all the fun things you learned that day and your body grows stronger.',
  'Sleep is essential because it''s when your brain processes and stores memories from the day, your body repairs itself and grows, and your immune system gets stronger to fight off germs!'
),
(
  'Why do people die?',
  'heart',
  6,
  '2025-04-15',
  'Death is a biological inevitability caused by cellular aging, disease, or trauma. As organisms age, cellular repair mechanisms become less efficient, leading to organ failure. It''s an evolutionary trade-off that allows for genetic diversity and resource allocation.',
  'Sometimes people go away and don''t come back. That''s okay to feel sad.',
  'Sometimes people get very old or very sick and their bodies stop working. It''s sad but natural.',
  'All living things have a beginning and an end. When people get very old, their bodies stop working.',
  'People die when they get very old or very sick and their bodies can''t work anymore. It''s part of life, like how leaves fall from trees.',
  'All living things have a life cycle - they''re born, they grow, and eventually their bodies get too old or sick to keep working. It''s a natural part of life, like how flowers bloom and then rest.',
  'Death is a natural part of the life cycle that all living things experience. As people age, their bodies gradually wear out and can''t repair themselves as well, or sometimes illness affects how their organs work. While it''s sad, death allows new generations to be born and continue life on Earth.'
),
(
  'What makes lightning?',
  'zap',
  5,
  '2025-06-08',
  'Lightning is caused by the buildup of electrical charge in storm clouds through friction between ice particles and water droplets. When the electrical potential difference becomes large enough, it creates a conductive channel, resulting in a lightning discharge.',
  'Big flash! Boom! From clouds!',
  'Lightning comes from storm clouds when they get really excited and make a big flash!',
  'Lightning happens when clouds bump into each other and make electricity, like a giant spark!',
  'Lightning is made when clouds rub together and build up electricity, then it jumps down like a big spark!',
  'Lightning happens when clouds rub together and build up electricity, just like when you rub your socks on carpet and get a little shock - but much, much bigger!',
  'Lightning forms when ice crystals and water droplets in storm clouds rub against each other, creating static electricity. When enough electrical charge builds up, it creates a powerful spark that jumps between the cloud and the ground - that''s lightning!'
),
(
  'How do trees grow so tall?',
  'tree',
  4,
  '2025-03-22',
  'Trees grow through photosynthesis, converting sunlight, carbon dioxide, and water into glucose for energy. Cell division in the cambium layer creates new wood and bark, while apical meristems enable vertical growth toward light sources.',
  'Tree drinks water! Gets big! Grows up up up!',
  'Trees drink water with their roots and eat sunshine to grow bigger and taller!',
  'Trees drink water through their roots and use sunlight to make food, which helps them grow tall!',
  'Trees drink water through their roots and eat sunlight with their leaves to make food that helps them grow taller!',
  'Trees drink water through their roots and eat sunlight with their leaves! They use this food to grow bigger and taller, adding new rings inside their trunk each year.',
  'Trees grow tall through a process called photosynthesis - they use their roots to absorb water and nutrients from soil, and their leaves capture sunlight and carbon dioxide from the air. They combine these ingredients to make their own food (sugar), which gives them energy to build new wood cells and grow taller each year!'
);

-- Create the questions table
CREATE TABLE IF NOT EXISTS questions (
  id BIGSERIAL PRIMARY KEY,
  question TEXT NOT NULL,
  icon_name TEXT NOT NULL DEFAULT 'help-circle',
  asked_by_age INTEGER NOT NULL CHECK (asked_by_age >= 2 AND asked_by_age <= 6),
  asked_date DATE NOT NULL,
  grownup_answer TEXT NOT NULL,
  kid_answers JSONB NOT NULL DEFAULT '{}',
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Create an index on created_at for ordering
CREATE INDEX IF NOT EXISTS idx_questions_created_at ON questions(created_at);

-- Create an index on asked_by_age for filtering
CREATE INDEX IF NOT EXISTS idx_questions_asked_by_age ON questions(asked_by_age);

-- Insert sample data
INSERT INTO questions (question, icon_name, asked_by_age, asked_date, grownup_answer, kid_answers) VALUES
(
  'Why is the sky blue?',
  'droplets',
  5,
  '2025-06-13',
  'The sky appears blue due to Rayleigh scattering. When sunlight enters Earth''s atmosphere, it collides with gas molecules. Blue light has a shorter wavelength and gets scattered more than other colors, making the sky appear blue to our eyes.',
  '{
    "age_2": "Sky blue! Pretty blue up there!",
    "age_3": "The sky is blue because the sun makes it blue! Like your blue shirt!",
    "age_4": "Sunlight has lots of colors mixed together, but we see blue the most when we look up at the sky!",
    "age_5": "The sky is blue because sunlight bounces off tiny pieces of air, and blue light bounces around more than other colors!",
    "age_6": "The sky is blue because sunlight bounces around tiny pieces of air in a special way that makes us see blue color the most!"
  }'
),
(
  'Where do babies come from?',
  'baby',
  4,
  '2025-05-28',
  'Human reproduction involves the fertilization of an egg by sperm, leading to embryonic development in the uterus over approximately 9 months. The process involves complex biological mechanisms including conception, gestation, and birth.',
  '{
    "age_2": "Baby in mommy''s tummy! Then baby comes out!",
    "age_3": "Babies grow in mommy''s belly and then come out when they''re ready to meet you!",
    "age_4": "Babies start very tiny in mommy''s tummy and grow bigger until they''re ready to be born!",
    "age_5": "Babies grow in a special place in mommy''s tummy called a womb, and when they''re big enough, they come out!",
    "age_6": "Babies grow in their mommy''s tummy in a special place called a womb. When they''re big enough and ready, they come out to meet their family!"
  }'
),
(
  'Why do we have to sleep?',
  'moon',
  3,
  '2025-07-02',
  'Sleep serves multiple critical functions including memory consolidation, cellular repair, immune system strengthening, and metabolic regulation. During sleep, the brain clears toxins and processes information from the day.',
  '{
    "age_2": "Sleep makes you big and strong! Night night!",
    "age_3": "We sleep so our bodies can rest and grow! Like how you charge your toys!",
    "age_4": "Sleep helps your body rest and your brain remember all the fun things you did today!",
    "age_5": "Sleep is like charging your body''s battery! Your brain cleans up and your body grows while you sleep!",
    "age_6": "Sleep is like charging your body''s battery! While you sleep, your brain organizes all the fun things you learned that day and your body grows stronger."
  }'
);

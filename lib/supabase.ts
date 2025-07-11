import { createClient } from "@supabase/supabase-js"
import type { Database } from "../types/database"

const supabaseUrl = "https://vcdxtclogmxrjwzgoymo.supabase.co"
const supabaseAnonKey =
  "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZjZHh0Y2xvZ214cmp3emdveW1vIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTIyNDgzNTgsImV4cCI6MjA2NzgyNDM1OH0.l61yoRD8tmUL129CiZ0UjV_k-CpGIsA6daOY9lFX2q8"

export const supabase = createClient<Database>(supabaseUrl, supabaseAnonKey)

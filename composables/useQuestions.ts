import type { Question } from "~/types/database"
import { useSupabase } from "~/composables/useSupabase"

export const useQuestions = () => {
  const { supabase } = useSupabase()

  const getQuestions = async (): Promise<Question[]> => {
    try {
      const { data, error } = await supabase.from("questions").select("*").order("created_at", { ascending: true })

      if (error) {
        console.error("Error fetching questions:", error)
        throw error
      }

      return data || []
    } catch (error) {
      console.error("Failed to fetch questions:", error)
      throw error
    }
  }

  const getQuestionById = async (id: number): Promise<Question | null> => {
    try {
      const { data, error } = await supabase.from("questions").select("*").eq("id", id).single()

      if (error) {
        console.error("Error fetching question:", error)
        throw error
      }

      return data
    } catch (error) {
      console.error("Failed to fetch question:", error)
      throw error
    }
  }

  return {
    getQuestions,
    getQuestionById,
  }
}

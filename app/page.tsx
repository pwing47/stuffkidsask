"use client"

import { useState, useEffect } from "react"
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
import { Badge } from "@/components/ui/badge"
import { Button } from "@/components/ui/button"
import { Baby, Moon, Droplets, Heart, Zap, TreePine, AlertCircle } from "lucide-react"
import { getQuestions } from "../lib/questions"
import type { Question } from "../types/database"
import { LoadingSkeleton } from "../components/loading-skeleton"
import type { JSX } from "react/jsx-runtime"

// Icon mapping for database icon names
const iconMap: Record<string, JSX.Element> = {
  droplets: <Droplets className="w-5 h-5" />,
  baby: <Baby className="w-5 h-5" />,
  moon: <Moon className="w-5 h-5" />,
  heart: <Heart className="w-5 h-5" />,
  zap: <Zap className="w-5 h-5" />,
  tree: <TreePine className="w-5 h-5" />,
}

export default function Page() {
  const [selectedAge, setSelectedAge] = useState<2 | 3 | 4 | 5 | 6 | 7>(4)
  const [questions, setQuestions] = useState<Question[]>([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)

  const ages = [2, 3, 4, 5, 6, 7] as const

  useEffect(() => {
    async function fetchQuestions() {
      try {
        setLoading(true)
        setError(null)
        const data = await getQuestions()
        setQuestions(data)
      } catch (err) {
        setError("Failed to load questions. Please try again later.")
        console.error("Error loading questions:", err)
      } finally {
        setLoading(false)
      }
    }

    fetchQuestions()
  }, [])

  const getKidAnswer = (question: Question, age: 2 | 3 | 4 | 5 | 6 | 7): string => {
    const columnName = `kid_answer_age_${age}` as keyof Question
    return (question[columnName] as string) || "Answer not available for this age."
  }

  const formatDate = (dateString: string): string => {
    const date = new Date(dateString)
    return date.toLocaleDateString("en-US", {
      year: "numeric",
      month: "long",
      day: "numeric",
    })
  }

  if (loading) {
    return (
      <div className="min-h-screen bg-gray-50">
        <header className="bg-white border-b border-gray-200 sticky top-0 z-10">
          <div className="container mx-auto px-6 py-8">
            <h1 className="text-4xl md:text-5xl font-bold text-center text-gray-900">Stuff My Kids Ask</h1>
            <p className="text-center text-gray-600 mt-3 text-lg font-medium">
              Curious questions deserve thoughtful answers
            </p>
            <div className="flex items-center justify-center gap-3 mt-6">
              <span className="text-sm font-medium text-gray-600">Select age:</span>
              <div className="flex gap-1">
                {ages.map((age) => (
                  <Button
                    key={age}
                    variant="ghost"
                    size="sm"
                    disabled
                    className="h-8 w-8 p-0 text-sm font-medium text-gray-400"
                  >
                    {age}
                  </Button>
                ))}
              </div>
            </div>
          </div>
        </header>
        <main className="container mx-auto px-6 py-12">
          <LoadingSkeleton />
        </main>
      </div>
    )
  }

  if (error) {
    return (
      <div className="min-h-screen bg-gray-50">
        <header className="bg-white border-b border-gray-200 sticky top-0 z-10">
          <div className="container mx-auto px-6 py-8">
            <h1 className="text-4xl md:text-5xl font-bold text-center text-gray-900">Stuff My Kids Ask</h1>
            <p className="text-center text-gray-600 mt-3 text-lg font-medium">
              Curious questions deserve thoughtful answers
            </p>
          </div>
        </header>
        <main className="container mx-auto px-6 py-12">
          <div className="max-w-4xl mx-auto">
            <Card className="border border-red-200 bg-red-50">
              <CardContent className="flex items-center gap-3 p-6">
                <AlertCircle className="w-5 h-5 text-red-600" />
                <div>
                  <h3 className="font-semibold text-red-900">Error Loading Questions</h3>
                  <p className="text-red-700 text-sm mt-1">{error}</p>
                  <Button
                    onClick={() => window.location.reload()}
                    variant="outline"
                    size="sm"
                    className="mt-3 border-red-300 text-red-700 hover:bg-red-100"
                  >
                    Try Again
                  </Button>
                </div>
              </CardContent>
            </Card>
          </div>
        </main>
      </div>
    )
  }

  return (
    <div className="min-h-screen bg-gray-50">
      {/* Header */}
      <header className="bg-white border-b border-gray-200 sticky top-0 z-10">
        <div className="container mx-auto px-6 py-8">
          <h1 className="text-4xl md:text-5xl font-bold text-center text-gray-900">Stuff My Kids Ask</h1>
          <p className="text-center text-gray-600 mt-3 text-lg font-medium">
            Curious questions deserve thoughtful answers
          </p>

          {/* Age Selector */}
          <div className="flex items-center justify-center gap-3 mt-6">
            <span className="text-sm font-medium text-gray-600">Select age:</span>
            <div className="flex gap-1">
              {ages.map((age) => (
                <Button
                  key={age}
                  variant={selectedAge === age ? "default" : "ghost"}
                  size="sm"
                  onClick={() => setSelectedAge(age)}
                  className={`h-8 w-8 p-0 text-sm font-medium transition-all ${
                    selectedAge === age
                      ? "bg-gray-900 hover:bg-gray-800 text-white shadow-sm"
                      : "text-gray-600 hover:text-gray-900 hover:bg-gray-100"
                  }`}
                >
                  {age}
                </Button>
              ))}
            </div>
          </div>
        </div>
      </header>

      {/* Main Content */}
      <main className="container mx-auto px-6 py-12">
        <div className="max-w-4xl mx-auto space-y-8">
          {questions.length === 0 ? (
            <Card className="border border-gray-200 bg-white">
              <CardContent className="text-center py-12">
                <p className="text-gray-500">No questions found. Check back later!</p>
              </CardContent>
            </Card>
          ) : (
            questions.map((item) => (
              <Card
                key={item.id}
                className="group hover:shadow-lg transition-all duration-200 border border-gray-200 bg-white hover:border-gray-300"
              >
                <CardHeader className="pb-4">
                  <div className="flex items-start justify-between gap-4">
                    <CardTitle className="flex items-center gap-3 text-xl font-semibold text-gray-900 flex-1">
                      {/* <div className="flex items-center justify-center w-10 h-10 rounded-lg bg-gray-100 text-gray-700 group-hover:bg-gray-200 transition-colors">
                        {iconMap[item.icon_name] || <AlertCircle className="w-5 h-5" />}
                      </div> */}
                      {item.question}
                    </CardTitle>
                    <div className="text-right text-xs text-gray-400 mt-1 flex-shrink-0">
                      <div>Asked by a {item.asked_by_age}-year old</div>
                      <div className="mt-0.5">{formatDate(item.asked_date)}</div>
                    </div>
                  </div>
                </CardHeader>
                <CardContent className="pt-0 space-y-8">
                  {/* Kid Answer */}
                  <div className="space-y-4">
                    <div className="flex items-center justify-between">
                      <Badge variant="secondary" className="bg-blue-50 text-blue-700 border-blue-200 hover:bg-blue-100">
                        👶 For a {selectedAge}-year old kid
                      </Badge>
                    </div>

                    <div className="bg-blue-50 border border-blue-100 rounded-lg p-4">
                      <p className="text-gray-800 leading-relaxed">{getKidAnswer(item, selectedAge)}</p>
                    </div>
                  </div>

                  {/* Grown-up Answer */}
                  <div className="space-y-4">
                    <Badge variant="secondary" className="bg-gray-50 text-gray-700 border-gray-200 hover:bg-gray-100">
                      🧑‍🎓 For Grown-Ups
                    </Badge>
                    <div className="bg-gray-50 border border-gray-200 rounded-lg p-4">
                      <p className="text-gray-700 text-sm leading-relaxed">{item.grownup_answer}</p>
                    </div>
                  </div>
                </CardContent>
              </Card>
            ))
          )}
        </div>

        {/* Footer */}
        <div className="text-center mt-16 py-8">
          <p className="text-gray-500 text-sm">Created by <strong><a href="https://www.philipcowles.com">Philip Cowles</a></strong><br/>for his curious kids 🌟</p>
        </div>
      </main>
    </div>
  )
}

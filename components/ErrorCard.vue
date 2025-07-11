<template>
  <div class="max-w-4xl mx-auto">
    <div class="border border-red-200 bg-red-50 rounded-lg shadow-sm">
      <div class="flex items-center gap-3 p-6">
        <AlertCircleIcon class="w-5 h-5 text-red-600" />
        <div>
          <h3 class="font-semibold text-red-900">Error Loading Questions</h3>
          <p class="text-red-700 text-sm mt-1">{{ error }}</p>
          <button
            @click="retry"
            class="mt-3 px-3 py-1 text-sm border border-red-300 text-red-700 hover:bg-red-100 rounded transition-colors"
          >
            Try Again
          </button>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { AlertCircleIcon } from 'lucide-vue-next'

interface Props {
  error: string
}

defineProps<Props>()

const emit = defineEmits<{
  retry: []
}>()

const retry = () => {
  emit('retry')
}
</script>

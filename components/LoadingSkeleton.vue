<template>
  <div class="max-w-4xl mx-auto space-y-8">
    <div
      v-for="i in 3"
      :key="i"
      class="border border-gray-200 bg-white rounded-lg shadow-sm"
    >
      <div class="p-6 pb-4">
        <div class="flex items-start justify-between gap-4">
          <div class="flex items-center gap-3 flex-1">
            <div class="w-10 h-10 rounded-lg bg-gray-200 animate-pulse" />
            <div class="h-6 bg-gray-200 rounded animate-pulse flex-1 max-w-md" />
          </div>
          <div class="text-right space-y-1">
            <div class="h-3 w-24 bg-gray-200 rounded animate-pulse" />
            <div class="h-3 w-20 bg-gray-200 rounded animate-pulse" />
          </div>
        </div>
      </div>
      <div class="px-6 pb-6 space-y-8">
        <div class="space-y-4">
          <div class="h-6 w-32 bg-gray-200 rounded animate-pulse" />
          <div class="bg-gray-100 rounded-lg p-4">
            <div class="space-y-2">
              <div class="h-4 bg-gray-200 rounded animate-pulse" />
              <div class="h-4 bg-gray-200 rounded animate-pulse w-3/4" />
            </div>
          </div>
        </div>
        <div class="space-y-4">
          <div class="h-6 w-32 bg-gray-200 rounded animate-pulse" />
          <div class="bg-gray-100 rounded-lg p-4">
            <div class="space-y-2">
              <div class="h-4 bg-gray-200 rounded animate-pulse" />
              <div class="h-4 bg-gray-200 rounded animate-pulse w-4/5" />
              <div class="h-4 bg-gray-200 rounded animate-pulse w-2/3" />
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

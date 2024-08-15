<template>
    <div>
      <h1>Carrinho</h1>
      <ul>
        <li v-for="item in itensCarrinho" :key="item.id">
          {{ item.descricao }} - R$ {{ item.precoUnidadeAtual.toFixed(2) }}
        </li>
      </ul>
      <p v-if="itensCarrinho.length === 0">Seu carrinho está vazio.</p>
    </div>
  </template>
  
  <script setup>
  import { ref } from 'vue';
  
  // Recebe os itens do carrinho do App.vue
  const itensCarrinho = ref([]);
  </script>
  
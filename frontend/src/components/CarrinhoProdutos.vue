<template>
  <div class="container">
    <h4 class="p-1 mb-1 bg-success text-white">Itens no Carrinho</h4>
    <hr />
    <div v-if="produto">
      <p><strong>Descrição:</strong> {{ produto.imagemProduto }} </p>
      <p><strong>Descrição:</strong> {{ produto.descricao }} </p>
      <p><strong>Preço:</strong> R$ {{ produto.precoUnidadeAtual.toFixed(2) }} </p>
      <p><strong>Informações:</strong> {{ produto.informacoes }} </p>
    </div>
    <div v-else>
      <p>Nenhum produto no carrinho.</p>
    </div>
    <div class="mb-3 d-flex justify-content-end">
      <button
        class="btn btn-primary m-2"
        type="submit"
        v-on:click.prevent="salvarProduto"
      >
        <i class="bi bi-clipboard2-check"></i>
        Finalizar Pedido
      </button>
      <button
        class="btn btn-warning m-2"
        type="submit"
        v-on:click.prevent="cancelar"
      >
        <i class="bi bi-clipboard2-x"></i>
        Cancelar
      </button>
    </div>
  </div>
</template>
  
  <script>
import axios from "axios";
export default {
  props: {
    produto: {
      type: Object,
      required: false,
    },
  },
  data() {
    return {
      id: "",
      descricao: "",
      quantidadeEstoque: "",
      precoUnidadeAtual: "",
      ativo: "",
      isInvalido: false,
    };
  },
  methods: {
    async salvarProduto() {
      if (this.descricao === "") {
        this.isInvalido = true;
        return;
      }
      this.isInvalido = false;

      if (this.id === "") {
        //incluir pelo POST da API
        const response = await axios.post("http://localhost:8080/produto", {
          id: this.id,
          descricao: this.descricao,
          quantidadeEstoque: this.quantidadeEstoque,
          precoUnidadeAtual: this.precoUnidadeAtual,
          ativo: this.ativo,
        });
        this.listaProdutos = response.data;
      } else {
        // alterar pelo PUT da API
        const response = await axios.put(
          `http://localhost:8080/produto/${this.id}`,
          {
            id: this.id,
            descricao: this.descricao,
            quantidadeEstoque: this.quantidadeEstoque,
            precoUnidadeAtual: this.precoUnidadeAtual,
            ativo: this.ativo,
          }
        );
        this.listaProdutos = response.data;
      }

      this.$emit("salvar_produto", {
        id: this.id,
        descricao: this.descricao,
        quantidadeEstoque: this.quantidadeEstoque,
        precoUnidadeAtual: this.precoUnidadeAtual,
        ativo: this.ativo,
      });

      this.id = "";
      this.descricao = "";
      this.quantidadeEstoque = "";
      this.precoUnidadeAtual = "";
      this.ativo = "";
    },
    cancelar() {
      this.id = "";
      this.descricao = "";
      this.quantidadeEstoque = "";
      this.precoUnidadeAtual = "";
      this.ativo = "";
      this.$emit("cancelar", true);
    },
  },
  mounted() {
  },
  computed: {
    getAcao() {
      return this.id === "" ? "Incluir" : "Alterar";
    },
  },
};
</script>

<style scoped>
.container {
  color: black;
}
</style>
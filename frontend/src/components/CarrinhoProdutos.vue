<template>
  <div class="container">
    <h4 class="p-1 mb-1 bg-success text-white">Itens no Carrinho</h4>
    <hr />
    <div v-if="produtos && produtos.length">
      <div v-for="produto in produtos" :key="produto.id" class="produto-item">
        <img
          :src="getImagemUrl(produto.imagemProduto)"
          alt="Imagem do produto"
          class="img-fluid"
          width="150"
        />
      <p><strong>Descrição:</strong> {{ produto.descricao }} </p>
      <p><strong>Preço:</strong> R$ {{ produto.precoUnidadeAtual.toFixed(2) }} </p>
      <p><strong>Informações:</strong> {{ produto.informacoes }} </p>
      <hr>
    </div>
    </div>
    <div v-else>
      <p>Nenhum produto no carrinho.</p>
    </div>
    <div class="mb-3 d-flex justify-content-end">
      <button
        class="btn btn-primary m-2"
        type="submit"
        @click.prevent="salvarProduto"
      >
        <i class="bi bi-clipboard2-check"></i>
        Finalizar Pedido
      </button>
      <button
        class="btn btn-warning m-2"
        type="submit"
        @click.prevent="voltar"
      >
        <i class="bi bi-arrow-repeat"></i>
        Continuar Comprando
      </button>
      <button
        class="btn btn-danger m-2"
        type="submit"
        @click.prevent="adicionarMaisItens()"
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
    produtos: {
      type: Array,
      required: false, 
      default: () => [] 
    }
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
    getImagemUrl(imagemProduto) {
      return `data:image/jpeg;base64,${imagemProduto}`;
    },
    adicionarMaisItens(){
      this.$emit("adicionarMaisItens", true);
    }
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
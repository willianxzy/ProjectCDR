<template>
   <div class="row">
    <div v-for="produto in listaProdutos" :key="produto.id" class="col-md-4 mb-3">
      <div class="card h-100">
        <img :src="getImagemUrl(produto.imagemProduto)" class="card-img-top" width="100px" height="300px"/>
        <div class="card-body">
          <h5 class="card-title">{{ produto.descricao }}</h5>
          <p class="card-text">
            Valor: R$ {{ produto.precoUnidadeAtual }}
            <br />
            Quantidade Disponível: {{ produto.quantidadeEstoque }}
          </p>
          <a href="" class="btn btn-primary">Adicione ao Carrinho</a>
        </div>
      </div>
    </div>
  </div>
</template>


<script>
import axios from "axios";
export default {
  components: {},
  data() {
    return {
      listaProdutos: [],
      pageNumber: 1,
      pageSize: 10,
      direction: "ASC",
      property: "id",
      totalPages: 0,
    };
  },
  methods: {
    async buscarProdutos() {
      this.produtoEscolhido = null;
      this.formVisible = false;

      //buscar a lista de formas de pagamentos no servidor
      const response = await axios.get(
        `http://localhost:8080/produtos?pageNumber=${this.pageNumber}&pageSize=${this.pageSize}&direction=${this.direction}&property=${this.property}`
      );
      console.log(response.data);
      this.listaProdutos = response.data.content;
      this.totalPages = response.data.totalPages;
      console.log(this.totalPages);
    },
    getImagemUrl(imagemProduto) {
      return `data:image/jpeg;base64,${imagemProduto}`;
    },
  },
  mounted() {
    this.buscarProdutos();
  },
};
</script>

<style scoped>
.card {
  width: 18rem;
}
</style>

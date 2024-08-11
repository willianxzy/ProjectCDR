<template>
  <div class="container">
    <div class="row">
      <div class="col-10">
        <h3>PRODUTOS</h3>
      </div>
    </div>
  </div>
  <CardProduto></CardProduto>
  <div v-if="!formVisible">
    <hr />
    <div class="container">
      <div class="row d-flex justify-content-center">
        <div class="col-auto">

          <button v-for="pagina in totalPages" :key="pagina" @click.prevent="irPara(pagina)" class="btn btn-light ms-1">
            {{ pagina }}
          </button>


        </div>
        <div class="col-auto">
          <input type="text" v-model="pageNumber" placeholder="Número da pagina" class="form-control w-25" />
        </div>
        <div class="col-auto">
          <select v-model="pageSize" class="form-select">
            <option value="2">2</option>
            <option value="10">10</option>
            <option value="20">20</option>
            <option value="50">50</option>
          </select>
        </div>
        <div class="col-auto">
          <select v-model="property" class="form-select">
            <option value="id">ID</option>
            <option value="descricao">Descrição</option>
          </select>
        </div>
        <div class="col-auto">
          <select v-model="direction" class="form-select">
            <option value="ASC">Crescente</option>
            <option value="DESC">Decrescente</option>
          </select>
        </div>
        <div class="col-auto">
          <button @click.prevent="buscarProdutos" class="btn btn-success">
            <i class="bi bi-binoculars"></i>
            Buscar
          </button>
        </div>
      </div>
    </div>
  </div>
</template>


<script>
import CardProduto from "./CardProduto.vue";
import axios from "axios";
export default {
  components: {
    CardProduto,
  },
  data() {
    return {
      listaProdutos: [],
      produtoEscolhido: null,
      formVisible: false,
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
    limpar() {
      this.produtoEscolhido = null;
      this.formVisible = !this.formVisible;
    },
    novoProduto() {
      this.formVisible = !this.formVisible;
    },
    alterarProduto(produto) {
      this.produtoEscolhido = produto;
      this.formVisible = true;
    },
    async excluirProduto(id) {
      const response = await axios.delete(`http://localhost:8080/produto/${id}`);
      console.log(response.data);
      this.buscarProdutos();
    },
    irPara(pagina) {
      this.pageNumber = pagina;
      this.buscarProdutos();
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

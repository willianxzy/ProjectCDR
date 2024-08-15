<template>
  <div class="container">
    <div class="row">
      <div class="col-10">
        <h3>PRODUTOS</h3>
      </div>
      <div class="col-2 d-flex justify-content-end">
        <button v-if="!formVisible" @click="formVisible = !formVisible" class="btn btn-success">
          <i class="bi bi-clipboard-plus"></i> Carrinho ({{ cartCount }})
        </button>
      </div>
    </div>
  </div>
  <CarrinhoProdutos
      v-if="formVisible"
      :produto="produtoEscolhido"
      @cancelar="limpar"
      @salvar_produto="buscarProdutos"
    />

  <!-- CARD DE EXIBIÇÃO DOS PRODUTOS -->
  <div v-if="!formVisible">
    <div class="container">
      <div class="row justify-content-center">
        <div v-for="produto in listaProdutos" :key="produto.id" class="col-md-4 mb-3">
          <div class="card h-100 text-center">
            <img :src="getImagemUrl(produto.imagemProduto)" class="card-img-top" width="100px" height="300px" />
            <div class="card-body">
              <h5 class="card-title">{{ produto.descricao }}</h5>
              <p class="card-text">
                Valor: R$ {{ produto.precoUnidadeAtual.toFixed(2) }}
                <br />
                {{ produto.informacoes }}
              </p>
              <button class="btn btn-primary" @click="adicionarAoCarrinho(produto)">
                Adicione ao Carrinho
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- PAGINAÇÃO E ORDENAÇÃO -->
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
import axios from "axios";
import CarrinhoProdutos from "./CarrinhoProdutos.vue";
export default {
  components: {
    CarrinhoProdutos
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
      cartCount: 0,
      cart: {},
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
    },
    limpar() {
      this.produtoEscolhido = null;
      this.formVisible = !this.formVisible;
      this.cartCount = 0;
      this.cart = [];
    },
    alterarProduto(produto) {
      this.produtoEscolhido = produto;
      this.formVisible = true;
    },
    async excluirProduto(id) {
      const response = await axios.delete(
        `http://localhost:8080/produto/${id}`
      );
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
    adicionarAoCarrinho(produto) {
    if (!this.cart[produto.id]) {
      this.cart[produto.id] = produto;
    }
    this.cartCount = Object.keys(this.cart).length;
    this.produtoEscolhido = produto;
    console.log("Produto adicionado ao carrinho:", produto);
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

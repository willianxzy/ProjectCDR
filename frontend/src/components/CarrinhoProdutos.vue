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
      <p v-if="produto.informacoes"><strong>Informações:</strong> {{ produto.informacoes }}</p>
      <label><strong>Quantidade:</strong></label>
      <div class="input-group">
        <button class="btn btn-outline-secondary" @click="decrementar(produto)">-</button>
        <input type="text" v-model.number="produto.quantidade" class="form-control text-center" />
        <button class="btn btn-outline-secondary" @click="incrementar(produto)">+</button>
      </div>
      <p><strong>SubTotal:</strong> R$ {{ (produto.precoUnidadeAtual * produto.quantidade).toFixed(2) }}</p>
      <button @click="removerProduto(produto)" class="btn btn-danger mt-2">Remover</button>
      <hr>
    </div>
    <p><strong>Total do Pedido:</strong> R$ {{ calcularTotalPedido().toFixed(2) }}</p>
    </div>
    <div v-else>
      <p>Nenhum produto no carrinho.</p>
    </div>
    <div class="mb-3 d-flex justify-content-end">
      <button
        class="btn btn-danger m-2"
        type="submit"
        @click.prevent="cancelar"
      >
        <i class="bi bi-clipboard2-x"></i>
        Cancelar
      </button>
      <button
      class="btn btn-warning m-2"
      type="submit"
      @click="continuarComprando"
      >
      <i class="bi bi-arrow-repeat"></i>
      Continuar Comprando
    </button>
    <button
      class="btn btn-primary m-2"
      type="submit"
      @click="mostrarFormulario"
    >
      <i class="bi bi-clipboard2-check"></i>
      Finalizar Pedido
    </button>
    </div>
    <!-- Formulário de Dados do Cliente -->
    <DadosCliente v-if="formularioVisivel" @dadosCliente="finalizarPedido" @cancelar="formularioVisivel = false" />
  </div>
</template>
  
  <script>
import axios from "axios";
import DadosCliente from './DadosCliente.vue';
export default {
  components: {
    DadosCliente,
  },
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
      formularioVisivel: false,
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
    incrementar(produto) {
      produto.quantidade += 1;
    },
    decrementar(produto) {
      if (produto.quantidade > 1) {
        produto.quantidade -= 1;
      }
    },
    calcularTotalPedido() {
      return this.produtos.reduce((total, produto) => {
        return total + (produto.precoUnidadeAtual * produto.quantidade);
      }, 0);
    },
    mostrarFormulario() {
      this.formularioVisivel = true;
    },
    finalizarPedido(dadosCliente) {

      const tituloPedido = `***** _PEDIDO_ *****`;

      const mensagemProdutos = this.produtos.map((produto) => {
        return `Produto: ${produto.descricao}\nQuantidade: ${produto.quantidade}\nSubtotal: R$ ${(
          produto.precoUnidadeAtual * produto.quantidade
        ).toFixed(2)}\n\n---------------------------------`;
      }).join('\n\n');

      const totalPedido = `Total do Pedido: R$ ${this.calcularTotalPedido().toFixed(2)}`;

      const mensagemCliente = `***** _DADOS CLIENTE_ *****\nNome: ${dadosCliente.nome}\nTelefone: ${dadosCliente.telefone}\n\n***** _ENDEREÇO_ *****\nEndereço: ${dadosCliente.endereco}\nCidade: ${dadosCliente.cidade}\nBairro: ${dadosCliente.bairro}\nNúmero: ${dadosCliente.numero}\nReferência: ${dadosCliente.referencia}\nCEP: ${dadosCliente.cep}`;

      const mensagemFinal = `${mensagemCliente}\n\n${tituloPedido}\n\n${mensagemProdutos}\n\n${totalPedido}`;

      const numeroWhatsapp = '5527998270870';

      const url = `https://api.whatsapp.com/send?phone=${numeroWhatsapp}&text=${encodeURIComponent(mensagemFinal)}`;

      window.open(url, '_blank');
    },
    continuarComprando() {
      this.$emit("continuar_comprando");
    },
    removerProduto(produto){
      this.$emit("remover_produto", produto);
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
.input-group{
  max-width: 120px;
  margin-bottom: 10px;
}
.img-fluid {
  border-radius: 10px;
}
</style>
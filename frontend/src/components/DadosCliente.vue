<template>
    <div class="formulario-container">
      <h3>Dados do Cliente</h3>
      <form @submit.prevent="enviarPedido">
        <div class="mb-3">
          <label for="nome" class="form-label">Nome</label>
          <input type="text" id="nome" v-model="nome" class="form-control" required />
        </div>
  
        <div class="mb-3">
          <label for="telefone" class="form-label">Telefone</label>
          <input type="text" id="telefone" v-model="telefone" class="form-control" required />
        </div>
  
        <div class="mb-3">
          <label for="endereco" class="form-label">Endereço</label>
          <input type="text" id="endereco" v-model="endereco" class="form-control" required />
        </div>
  
        <div class="mb-3">
          <label for="cidade" class="form-label">Cidade</label>
          <input type="text" id="cidade" v-model="cidade" class="form-control" required />
        </div>

        <div class="mb-3">
          <label for="bairro" class="form-label">Bairro</label>
          <input type="text" id="bairro" v-model="bairro" class="form-control" required />
        </div>

        <div class="mb-3">
          <label for="numero" class="form-label">Número</label>
          <input type="text" id="numero" v-model="numero" class="form-control" required />
        </div>

        <div class="mb-3">
          <label for="referencia" class="form-label">Referência</label>
          <input type="text" id="referencia" v-model="referencia" class="form-control"/>
        </div>
  
        <div class="mb-3">
          <label for="cep" class="form-label">CEP</label>
          <input type="text" id="cep" v-model="cep" class="form-control" required />
        </div>
  
        <button type="submit" class="btn btn-success">Enviar Pedido</button>
        <button type="button" class="btn btn-secondary ms-2" @click="cancelar">Cancelar</button>
      </form>
    </div>
  </template>
  
  <script>
  export default {
    data() {
      return {
        nome: "",
        telefone: "",
        endereco: "",
        cidade: "",
        bairro: "",
        numero: "",
        referencia: "",
        cep: ""
      };
    },
    methods: {
      enviarPedido() {
        const dadosCliente = {
          nome: this.nome,
          telefone: this.telefone,
          endereco: this.endereco,
          cidade: this.cidade,
          bairro: this.bairro,
          numero: this.numero,
          referencia: this.referencia,
          cep: this.cep
        };
        this.$emit("dadosCliente", dadosCliente);
      },
      cancelar() {
        this.$emit("cancelar");
      }
    }
  };
  </script>
  
  <style scoped>
  .formulario-container {
    color: black;
    max-width: 500px;
    margin: auto;
    padding: 20px;
    border: 1px solid #ddd;
    border-radius: 5px;
  }
  </style>
  
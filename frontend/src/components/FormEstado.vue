<template>
  <div class="container">
    <h4 class="p-1 mb-1 bg-success text-white">{{ getAcao }} Estado</h4>
    <hr />
    <form>
      <div class="mb-3">
        <label class="form-label">Id</label>
        <input
          class="form-control"
          type="text"
          v-model="id"
          :disabled="true"
          placeholder="Id estado"
        />
      </div>
      <div class="mb-3">
        <label class="form-label">Nome</label>
        <input
          class="form-control"
          type="text"
          v-model="nome"
          placeholder="Nome"
        />
      </div>
      <div v-if="isInvalido" class="alert alert-danger d-flex align-items-center" role="alert">
        <i class="bi bi-exclamation-triangle-fill"></i>
        <div class="p-2">Nome deve ser preenchido!!</div>
      </div>
      <div class="mb-3 d-flex justify-content-end">
        <button
          class="btn btn-primary m-2"
          type="submit"
          v-on:click.prevent="salvarEstado"
        >
        <i class="bi bi-clipboard2-check"></i>
          {{ getAcao }}
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
    </form>
  </div>
</template>

<script>
import axios from "axios";
export default {
  props: {
    propsEstado: Object,
  },
  data() {
    return {
      id: "",
      nome: "",
      isInvalido: false,
    };
  },
  methods: {
    async salvarEstado() {
      if (this.nome === "") {
        this.isInvalido = true;
        return;
      }
      this.isInvalido = false;

      if (this.id === "") {
        //incluir pelo POST da API
        const response = await axios.post("http://localhost:8080/estado", {
          id: this.id,
          nome: this.nome,
        });
        this.listaEstados = response.data;
      } else {
        // alterar pelo PUT da API
        const response = await axios.put(
          `http://localhost:8080/estado/${this.id}`,
          {
            id: this.id,
            nome: this.nome,
          }
        );
        this.listaEstados = response.data;
      }

      this.$emit("salvar_estado", {
        id: this.id,
        nome: this.nome,
      });

      this.id = "";
      this.nome = "";
    },
    cancelar() {
      this.id = "";
      this.nome = "";
      this.$emit("cancelar", true);
    },
  },
  mounted() {
    if (this.propsEstado) {
      this.id = this.propsEstado.id;
      this.nome = this.propsEstado.nome;
    }
  },
  computed: {
    getAcao() {
      return this.id === "" ? "Incluir" : "Alterar";
    },
  },
};
</script>


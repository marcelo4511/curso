<template>
    <div>
        <h1>Sistema de Agendamento</h1>
        <div class="max-w-sm mx-auto p-6 bg-white border border-gray-200 rounded-lg shadow-md">
            <h2 class="text-2xl font-semibold text-center mb-4">Cadastrar</h2>
            
            <!-- Formulário de cadastro -->
            <div>
                <!-- Input -->
                <div class="mb-4">
                    <label for="name" class="block text-sm font-medium text-gray-700">Nome</label>
                    <input type="text" v-model="form.nome" id="name" name="name" class="mt-1 block w-full px-4 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500" placeholder="Digite seu nome">
                </div>

                <!-- Botão -->
                <button @click="save" class="w-full px-4 py-2 mt-4 bg-blue-500 text-white font-semibold rounded-lg hover:bg-blue-600 focus:outline-none focus:ring-2 focus:ring-blue-400">
                    Cadastrar
                </button>
            </div>
        </div>
        <div class="overflow-x-auto">
            <table class="min-w-full bg-white border border-gray-200">
                <thead>
                    <tr class="bg-gray-100">
                        <th class="py-2 px-4 border-b text-left text-sm font-medium text-gray-700">Nome</th>
                        <th class="py-2 px-4 border-b text-left text-sm font-medium text-gray-700">Email</th>
                        <th class="py-2 px-4 border-b text-left text-sm font-medium text-gray-700">Status</th>
                        <th class="py-2 px-4 border-b text-left text-sm font-medium text-gray-700">Data de Cadastro</th>
                    </tr>
                </thead>
                <tbody>
                    <tr class="hover:bg-gray-50">
                        <td class="py-2 px-4 border-b text-sm text-gray-700">João Silva</td>
                        <td class="py-2 px-4 border-b text-sm text-gray-700">joao@example.com</td>
                        <td class="py-2 px-4 border-b text-sm text-gray-700">Ativo</td>
                        <td class="py-2 px-4 border-b text-sm text-gray-700">2024-01-01</td>
                    </tr>
                    <tr class="hover:bg-gray-50">
                        <td class="py-2 px-4 border-b text-sm text-gray-700">Maria Oliveira</td>
                        <td class="py-2 px-4 border-b text-sm text-gray-700">maria@example.com</td>
                        <td class="py-2 px-4 border-b text-sm text-gray-700">Inativo</td>
                        <td class="py-2 px-4 border-b text-sm text-gray-700">2024-02-15</td>
                    </tr>
                    <!-- Adicione mais linhas conforme necessário -->
                </tbody>
            </table>
        </div>
    </div>
</template>

<script>
import axios from 'axios'
export default {
    props: {
    },
    data() {
        return {
            form: {
                nome: null,
            },

            categorias: []
        }
    },

    methods: {
        save() {
            console.log('aaa')
            axios.post(`/`, this.form).then(res => {
                window.location.reload()
            }).catch(error => {
                if(error) {
                    if(error.status == 422) {
                        this.errors = error.response.data.message
                    }
                }
            })
        },
    },

    mounted(){
        axios.get('/get').then(res => {
            this.categorias = res.data
        })
    }
};
</script>

const express = require('express');
const sql = require('mssql');
const cors = require('cors');

const app = express();
app.use(express.json());
app.use(cors());

// Configuração do SQL Server
const dbConfig = {
    user: '***',
    password: '**',
    server: '***', // ou IP:porta
    port: 12345,
    database: '***',
    options: {
        encrypt: false, // true se estiver usando Azure
        trustServerCertificate: true,
    }
};

// Criar um pool de conexões global
let pool;

sql.connect(dbConfig).then((p) => {
    pool = p;
    console.log('Conectado ao SQL Server');
}).catch(err => {
    console.error('Erro ao conectar ao banco de dados:', err);
});

// Rota GET
app.get('/usuarios', async (req, res) => {
    try {
        if (!pool) return res.status(500).send('Sem conexão com o banco de dados');
        
        const result = await pool.request().query('SELECT * FROM TB_USUARIO');
        res.json(result.recordset);
    } catch (err) {
        console.error(err);
        res.status(500).send('Erro no servidor');
    }
});

app.listen(3000, () => console.log('API rodando na porta 3000'));

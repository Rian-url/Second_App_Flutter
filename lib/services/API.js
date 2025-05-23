const express = require('express');
const sql = require('mssql');
const cors = require('cors');

const app = express();
app.use(express.json());
app.use(cors());

const dbConfig = {
    user: '***',
    password: '***',
    server: '***',
    port: 11234,
    database: '***',
    options: {
        encrypt: false,
        trustServerCertificate: true,
    }
};


let pool;

sql.connect(dbConfig).then((p) => {
    pool = p;
    console.log('Conectado ao SQL');
}).catch(err => {
    console.error('Erro na conexão:', err);
});


app.get('/usuarios', async (req, res) => {
    try {
        if (!pool) return res.status(500).send('Sem conexão com o banco de dados');
        
        const result = await pool.request().query('SELECT * FROM TB_USUARIO');
        res.json(result.recordset);
    } catch (err) {
        console.error(err);
        res.status(500).send('Erro na rota');
    }
});

app.listen(3000, () => console.log('API rodando na porta 3000'));

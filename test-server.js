import express from 'express';
import { fileURLToPath } from 'url';
import path from 'path';
import { testConnection } from './src/models/db.js';
import { getAllOrganizations } from './src/models/organizations.js';
import { getAllProjects } from './src/models/projects.js';
import { getAllCategories } from './src/models/categories.js';

const app = express();

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

app.set('view engine', 'ejs');
app.set('views', path.join(__dirname, 'src/views'));
app.use(express.static(path.join(__dirname, 'public')));

app.get('/categories', async (req, res) => {
    console.log('ENTRAMOS A CATEGORIES');

    const categories = await getAllCategories();

    console.log('CATEGORIES:', categories);

    res.render('categories', {
        title: 'Categories',
        categories
    });
});

app.get('/', (req, res) => {
    res.send('Test server works!');
});

const server = app.listen(3001, async() => {
    console.log('Test server started!');
    console.log('Listening:', server.listening);

    await testConnection();

});

server.on('close', () => {
    console.log('Test server closed!');
});
import {
    getAllCategories,
    getCategoryById,
    getProjesctsByCategoryId
 } from "../models/categories.js";

const showCategoriesPage = async (req, res) => {
    const categories = await getAllCategories();
    const title = 'Categories';

    res.render('categories', { title, categories });
};

const showCategoryDetailsPage = async (req, res) => {
    const id = req.params.id;

    const category = await getCategoryById(id);
    const projects = await getProjesctsByCategoryId(id);

    const title = 'Category Details';

    res.render('category', { title, category, projects });
};

export { showCategoriesPage, showCategoryDetailsPage };
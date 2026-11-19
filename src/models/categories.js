import db from './db.js';

const getAllCategories = async () => {

    const query = `

        SELECT category_id, name, image_filename
        FROM categories
           
    `;

    const result = await db.query(query);
    return result.rows;

};

const getCategoryById = async (id) => {

    const query = `
        SELECT category_id, name, image_filename
        FROM categories
        WHERE category_id = $1;
    `;

    const queryParams = [id];
    const result = await db.query(query, queryParams);

    return result.rows[0];
};

const getCategoriesByProjectId = async (projectId) => {

    const query = `
        SELECT
            categories.category_id,
            categories.name,
            categories.image_filename
        FROM categories
        JOIN project_categories
            ON categories.category_id = project_categories.category_id
        WHERE project_categories.project_id = $1;
    `;

    const queryParams = [projectId];
    const result = await db.query(query, queryParams);

    return result.rows;
};

const getProjesctsByCategoryId = async (categoryId) => {

    const query = `
        SELECT
            projects.project_id,
            projects.title,
            projects.description,
            projects.date,
            projects.location
        FROM projects
        JOIN project_categories
            ON projects.project_id = project_categories.project_id
        WHERE project_categories.category_id = $1
        ORDER BY projects.date ASC;
    `;

    const queryParams = [categoryId];
    const result = await db.query(query, queryParams);

    return result.rows;
};


export {
    getAllCategories,
    getCategoryById,
    getCategoriesByProjectId,
    getProjesctsByCategoryId
};
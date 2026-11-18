import db from './db.js';

const getAllProjects = async () => {

    const query = `
        SELECT
                projects.project_id,
                projects.title,
                projects.description,
                projects.location,
                projects.date,
                organization.name AS organization_name
        FROM projects
        JOIN organization
        ON projects.organization_id = organization.organization_id;
    `;

    const result = await db.query(query);
    return result.rows;

};

const getProjectsByOrganizationId = async (organizationId) => {
    const query = `
        SELECT
            project_id,
            organization_id,
            title,
            description,
            location,
            date
        FROM projects
        WHERE organization_id = $1
        ORDER BY date;
    `;

    const queryParams = [organizationId];
    const result = await db.query(query, queryParams);

    return result.rows;
};

export { getAllProjects, getProjectsByOrganizationId };
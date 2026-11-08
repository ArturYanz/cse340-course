
-- ========================================
-- Organization Table
-- ========================================
CREATE TABLE organization (
    organization_id SERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    description TEXT NOT NULL,
    contact_email VARCHAR(255) NOT NULL,
    logo_filename VARCHAR(255) NOT NULL
);

-- Insert data: Organizations
INSERT INTO organization (name, description, contact_email, logo_filename)
VALUES
('BrightFuture Builders', 'A nonprofit focused on improving community infrastructure through sustainable construction projects.', 'info@brightfuturebuilders.org', 'brightfuture-logo.png'),
('GreenHarvest Growers', 'An urban farming collective promoting food sustainability and education in local neighborhoods.', 'contact@greenharvest.org', 'greenharvest-logo.png'),
('UnityServe Volunteers', 'A volunteer coordination group supporting local charities and service initiatives.', 'hello@unityserve.org', 'unityserve-logo.png');


 -- SELECT * FROM organization;
 
 -- SELECT * FROM projects;



-- Project Table

CREATE TABLE projects (
	project_id SERIAL PRIMARY KEY,
	organization_id INTEGER NOT NULL REFERENCES organization(organization_id),
	title VARCHAR(150) NOT NULL,
	description TEXT NOT NULL,
	location VARCHAR(100) NOT NULL,
	date DATE NOT NULL
);



INSERT INTO projects(organization_id, title, description, location, date)
VALUES

-- BrightFuture Builders (ID: 1)
(1,
'Community Park Renovation',
'A project focused on renovating a public park.',
'Santiago',
'2026-12-15'),

(1,
'School Playground Restoration',
'Restoring a school playground to provide children with a safe place for recreation.',
'Buin',
'2026-12-30'),

(1,
'Community Center Construction',
'Building a community center to support local activities and neighborhood gatherings.',
'Maipu',
'2027-01-10'),

(1,
'Public Library Improvement',
'Improving a public library by renovating its facilities and creating better reading spaces.',
'Rancagua',
'2027-01-18'),

(1,
'Sustainable Housing Project',
'Supporting the construction of affordable and environmentally friendly housing.',
'Puente Alto',
'2027-02-05'),

-- GreenHarvest Growers (ID: 2)
(2,
'Urban Community Garden',
'Creating a shared urban garden where residents can grow fresh vegetables and fruits.',
'Valparaiso',
'2026-12-12'),

(2,
'School Gardening Program',
'Teaching students how to grow plants and understand sustainable food production.',
'Buin',
'2026-12-22'),

(2,
'Organic Food Workshop',
'Organizing workshops to educate families about organic food and healthy eating habits.',
'Santiago',
'2027-01-08'),

(2,
'Neighborhood Tree Planting',
'Planting trees in residential areas to improve green spaces and environmental health.',
'Temuco',
'2027-01-25'),

(2,
'Sustainable Farming Education',
'Providing educational activities about sustainable farming and responsible agriculture.',
'Concepcion',
'2027-02-12'),

-- UnityServe Volunteers (ID: 3)
(3,
'Food Donation Campaign',
'Collecting and distributing food donations to families experiencing financial difficulties.',
'Santiago',
'2026-12-18'),

(3,
'Elderly Assistance Program',
'Organizing volunteers to assist elderly residents with daily activities and companionship.',
'San Fernando',
'2027-01-05'),

(3,
'Community Clothing Drive',
'Collecting clothes and distributing them to individuals and families in need.',
'Vina del Mar',
'2027-01-15'),

(3,
'Children Charity Event',
'Hosting a charity event to provide recreational activities and support for children.',
'Talcahuano',
'2027-02-02'),

(3,
'Homeless Support Initiative',
'Providing essential supplies and assistance to people experiencing homelessness.',
'La Florida',
'2027-02-20');

-- SELECT * FROM projects;

-- SELECT
--     p.project_id,
--     p.title,
--     o.name AS organization_name,
--     p.location,
--     p.date
-- FROM projects p
-- JOIN organization o
-- ON p.organization_id = o.organization_id;



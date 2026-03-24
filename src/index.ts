// EduMaster Pro Backend Entry Point - Rebuild Trigger For Decisions Schema Update
export default {
    /**
     * An asynchronous register function that runs before
     * your application is initialized.
     *
     * This gives you an opportunity to extend code.
     */
    register({ strapi }: { strapi: any }) {
        strapi.contentType('plugin::users-permissions.user').attributes.permissions = {
            type: 'json',
            configurable: false,
        };
    },

    /**
     * An asynchronous bootstrap function that runs before
     * your application gets started.
     *
     * This gives you an opportunity to set up your data model,
     * run jobs, or perform some special logic.
     */
    async bootstrap({ strapi }: { strapi: any }) {
        console.log(' EduMaster BOOTSTRAP STARTING...');

        try {
            // 1. Get the Authenticated Role
            const authenticatedRole = await strapi.query('plugin::users-permissions.role').findOne({ where: { type: 'authenticated' } });
            
            if (authenticatedRole) {
                console.log(` EduMaster Found Authenticated Role: ${authenticatedRole.id}`);
                
                // 1b. Fix Plugin Settings (Local login & Confirmation)
                const store = strapi.store({ type: 'plugin', name: 'users-permissions' });
                const advancedSettings = await store.get({ key: 'advanced' });
                console.log(' EduMaster Advanced Settings (BEFORE):', JSON.stringify(advancedSettings));
                
                await store.set({ 
                    key: 'advanced', 
                    value: { 
                        ...advancedSettings, 
                        email_confirmation: false, 
                        allow_register: true, 
                        register_default_role: authenticatedRole.id 
                    } 
                });
                console.log(' EduMaster Advanced Settings (UPDATED)');

                // 1c. Ensure Local Provider is enabled
                const grantSettings = await store.get({ key: 'grant' });
                if (grantSettings && grantSettings.local) {
                    grantSettings.local.enabled = true;
                    await store.set({ key: 'grant', value: grantSettings });
                    console.log(' EduMaster Local Provider (ENABLED)');
                }

                // 2. Grant Permissions
                const actionsToGrant = [
                    'api::class-decision.class-decision.find', 'api::class-decision.class-decision.findOne', 'api::class-decision.class-decision.create', 'api::class-decision.class-decision.update', 'api::class-decision.class-decision.delete',
                    'api::training-assignment.training-assignment.find', 'api::training-assignment.training-assignment.findOne', 'api::training-assignment.training-assignment.create', 'api::training-assignment.training-assignment.update', 'api::training-assignment.training-assignment.delete',
                    'api::exam-approval.exam-approval.find', 'api::exam-approval.exam-approval.findOne', 'api::exam-approval.exam-approval.create', 'api::exam-approval.exam-approval.update', 'api::exam-approval.exam-approval.delete',
                    'api::exam-grade.exam-grade.find', 'api::exam-grade.exam-grade.findOne', 'api::exam-grade.exam-grade.create', 'api::exam-grade.exam-grade.update', 'api::exam-grade.exam-grade.delete',
                    'api::student.student.find', 'api::student.student.findOne', 'api::student.student.create', 'api::student.student.update', 'api::student.student.delete',
                    'api::school-class.school-class.find', 'api::school-class.school-class.findOne', 'api::school-class.school-class.create', 'api::school-class.school-class.update', 'api::school-class.school-class.delete',
                    'api::subject.subject.find', 'api::subject.subject.findOne',
                    'api::teacher.teacher.find', 'api::teacher.teacher.findOne',
                    'api::classroom.classroom.find', 'api::classroom.classroom.findOne',
                    'api::print-template.print-template.find', 'api::print-template.print-template.findOne',
                    'api::audit-log.audit-log.find', 'api::audit-log.audit-log.findOne', 'api::audit-log.audit-log.create',
                    'plugin::users-permissions.user.me'
                ];

                for (const action of actionsToGrant) {
                   const existing = await strapi.query('plugin::users-permissions.permission').findOne({ where: { role: authenticatedRole.id, action: action } });
                   if (!existing) {
                       await strapi.query('plugin::users-permissions.permission').create({ data: { action, role: authenticatedRole.id } });
                       console.log(` EduMaster Granted ${action}`);
                   }
                }
            }

            // 3. Create/Update Demo Users
            const usersToCreate = [
                { username: 'duong', email: 'admin@edumaster.vn', password: 'EduMaster@2026' },
                { username: 'admin', email: 'support@edumaster.vn', password: 'admin123' }
            ];

                // 3a. Update "duong" user
                const duong = await strapi.query('plugin::users-permissions.user').findOne({ where: { username: 'duong' } });
                const duongData = {
                    username: 'duong',
                    email: 'duong@edumaster.pro',
                    password: 'EduMaster@2026',
                    role: authenticatedRole.id,
                    confirmed: true, // Force true
                    blocked: false,
                    provider: 'local', // Force local
                };

                if (!duong) {
                    await strapi.service('plugin::users-permissions.user').add(duongData);
                    console.log(' EduMaster Created "duong"');
                } else {
                    await strapi.query('plugin::users-permissions.user').update({
                        where: { id: duong.id },
                        data: {
                            password: duongData.password,
                            role: duongData.role,
                            confirmed: true,
                            blocked: false,
                            provider: 'local'
                        }
                    });
                    console.log(' EduMaster Updated "duong"');
                }

                // 3b. Update "admin" user
                const admin = await strapi.query('plugin::users-permissions.user').findOne({ where: { username: 'admin' } });
                const adminData = {
                    username: 'admin',
                    email: 'admin@edumaster.pro',
                    password: 'admin123',
                    role: authenticatedRole.id,
                    confirmed: true, // Force true
                    blocked: false,
                    provider: 'local', // Force local
                };

                if (!admin) {
                    await strapi.service('plugin::users-permissions.user').add(adminData);
                    console.log(' EduMaster Created "admin"');
                } else {
                    await strapi.query('plugin::users-permissions.user').update({
                        where: { id: admin.id },
                        data: {
                            password: adminData.password,
                            role: adminData.role,
                            confirmed: true,
                            blocked: false,
                            provider: 'local'
                        }
                    });
                    console.log(' EduMaster Updated "admin"');
                }

            console.log(' EduMaster BOOTSTRAP COMPLETE.');

        } catch (err: any) {
            console.error(' EduMaster BOOTSTRAP ERROR:', err.message);
            if (err.stack) console.error(err.stack);
        }
    },
};

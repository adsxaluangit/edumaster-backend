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

            // 3. Create/Update Demo Users with EXPLICIT HASHING
            const usersToCreate = [
                { username: 'duong', email: 'admin@edumaster.vn', password: 'EduMaster@2026' },
                { username: 'admin', email: 'support@edumaster.vn', password: 'admin123' }
            ];

            for (const userData of usersToCreate) {
                // Manually hash to be 100% sure
                console.log(` EduMaster Hashing password for "${userData.username}"...`);
                // In Strapi v5, we use the user service's hashPassword if possible
                let hashedPassword;
                try {
                     hashedPassword = await strapi.service('plugin::users-permissions.user').hashPassword({ password: userData.password });
                } catch (e) {
                     console.error(" EduMaster could not hash via service, trying common strapi internal...");
                     // Fallback to service add/edit which SHOULD hash
                }

                const existingUser = await strapi.query('plugin::users-permissions.user').findOne({ 
                    where: { username: userData.username } 
                });

                if (!existingUser) {
                    await strapi.service('plugin::users-permissions.user').add({
                        ...userData,
                        confirmed: true,
                        role: authenticatedRole?.id,
                        blocked: false
                    });
                    console.log(` EduMaster Created "${userData.username}" via service`);
                } else {
                    await strapi.service('plugin::users-permissions.user').edit(existingUser.id, { 
                        password: userData.password, 
                        confirmed: true,
                        blocked: false
                    });
                    console.log(` EduMaster Updated "${userData.username}" via service`);
                }

                // VERIFY TEST
                const verified = await strapi.query('plugin::users-permissions.user').findOne({ where: { username: userData.username } });
                const isValid = await strapi.service('plugin::users-permissions.user').validatePassword(userData.password, verified.password);
                console.log(` EduMaster LOGIN TEST for "${userData.username}": ${isValid ? 'PASSED' : 'FAILED'}`);
            }

            console.log(' EduMaster BOOTSTRAP COMPLETE.');

        } catch (err: any) {
            console.error(' EduMaster BOOTSTRAP ERROR:', err.message);
            if (err.stack) console.error(err.stack);
        }
    },
};

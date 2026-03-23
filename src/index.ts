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
        strapi.log.info('BOOTSTRAP: Starting EduMaster Pro system initialization...');

        try {
            // 1. Get the Authenticated Role
            const authenticatedRole = await strapi.query('plugin::users-permissions.role').findOne({ where: { type: 'authenticated' } });
            
            if (authenticatedRole) {
                // 2. Grant Permissions to Authenticated Role
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
                       strapi.log.info(`BOOTSTRAP: Granted ${action} to Authenticated role`);
                   }
                }
            }

            // 3. Create/Update Demo User 'duong'
            const existingUser = await strapi.query('plugin::users-permissions.user').findOne({ where: { username: 'duong' } });
            
            const userData = {
                username: 'duong',
                email: 'admin@edumaster.vn',
                password: 'EduMaster@2026',
                confirmed: true,
                role: authenticatedRole?.id,
                blocked: false
            };

            if (!existingUser && authenticatedRole) {
                // Use the user service to ensure password hashing
                await strapi.service('plugin::users-permissions.user').add(userData);
                strapi.log.info('BOOTSTRAP: Created demo user "duong" with password "EduMaster@2026"');
            } else if (existingUser) {
                // Update password for existing user to match the one provided to the user
                await strapi.service('plugin::users-permissions.user').edit(existingUser.id, { password: 'EduMaster@2026' });
                strapi.log.info('BOOTSTRAP: Updated password for existing user "duong" to "EduMaster@2026"');
            }

            strapi.log.info('BOOTSTRAP: Initialization complete. System is ready.');

        } catch (err) {
            strapi.log.error('BOOTSTRAP ERROR:', err);
        }
    },
};

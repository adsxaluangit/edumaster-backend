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
        // Automatically grant public permissions for class-decisions to avoid 403 errors
        try {
            strapi.log.info('BOOTSTRAP: Checking public permissions...');
            const publicRole = await strapi.query('plugin::users-permissions.role').findOne({ where: { type: 'public' } });

            if (publicRole) {
                const actions = [
                    'api::class-decision.class-decision.find',
                    'api::class-decision.class-decision.findOne',
                    'api::class-decision.class-decision.create',
                    'api::class-decision.class-decision.update',
                    'api::class-decision.class-decision.delete',
                    'api::training-assignment.training-assignment.find',
                    'api::training-assignment.training-assignment.findOne',
                    'api::training-assignment.training-assignment.create',
                    'api::training-assignment.training-assignment.update',
                    'api::training-assignment.training-assignment.delete',
                    'api::exam-approval.exam-approval.find',
                    'api::exam-approval.exam-approval.findOne',
                    'api::exam-approval.exam-approval.create',
                    'api::exam-approval.exam-approval.update',
                    'api::exam-approval.exam-approval.delete',
                    'api::exam-grade.exam-grade.find',
                    'api::exam-grade.exam-grade.findOne',
                    'api::exam-grade.exam-grade.create',
                    'api::exam-grade.exam-grade.update',
                    'api::exam-grade.exam-grade.delete',
                    'api::print-template.print-template.find',
                    'api::print-template.print-template.findOne',
                    'api::print-template.print-template.create',
                    'api::print-template.print-template.update',
                    'api::print-template.print-template.delete',
                    'api::audit-log.audit-log.find',
                    'api::audit-log.audit-log.findOne',
                    'api::audit-log.audit-log.create',
                    'api::audit-log.audit-log.update',
                    'api::audit-log.audit-log.delete',
                ];

                const existingPermissions = await strapi.query('plugin::users-permissions.permission').findMany({
                    where: {
                        role: publicRole.id,
                        action: { $in: actions }
                    }
                });

                const existingActions = existingPermissions.map((p: any) => p.action);

                for (const action of actions) {
                    if (!existingActions.includes(action)) {
                        await strapi.query('plugin::users-permissions.permission').create({
                            data: {
                                action: action,
                                role: publicRole.id,
                            }
                        });
                        strapi.log.info(`BOOTSTRAP: Granted public permission: ${action}`);
                    }
                }
                strapi.log.info('BOOTSTRAP: Permission check complete.');
            }
        } catch (error) {
            strapi.log.error('Failed to update public permissions for class-decision', error);
        }
    },
};

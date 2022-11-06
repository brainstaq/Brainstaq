class DropBlazerAudits < ActiveRecord::Migration[6.1]
  def change
    drop_table :blazer_audits, force: :cascade
    drop_table :blazer_checks, force: :cascade
    drop_table :blazer_dashboard_queries, force: :cascade
    drop_table :blazer_dashboards, force: :cascade
    drop_table :blazer_queries, force: :cascade
  end
end

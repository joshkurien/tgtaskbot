class AddBasicResponses < SeedMigration::Migration
  def up
    Response.create(key: 'welcome', text: 'Welcome')
    Response.create(key: 'spam', text: 'Please dont type random things')
  end

  def down
    Response.destroy_all
  end
end

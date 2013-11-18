class InjectedFeedback < ActiveRecord::Base

  establish_connection 'dummy'
  self.table_name = 'feedbacks'

  def injected_save
    sql = "INSERT INTO feedbacks (name, phone, email, description) VALUES
          ('#{name}', '#{phone}', '#{email}', '#{description}')"
    recrods_array = InjectedFeedback.connection.execute(sql)
  end

end
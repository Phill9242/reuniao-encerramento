class ExportExcelController < ApplicationController

  def export
    filename = "reunião_encerramento.xlsx"

    package = Axlsx::Package.new
    workbook = package.workbook
    @worksheet = workbook.add_worksheet(name: "Dados")
    
    @posts = Post.joins(:dev).order(:date, 'devs.name', :good_bad)
    @previous_date = nil
    @extra_lines = 1

    @posts.each_with_index do |post, index|
      if @previous_date != post.date
        make_header_for_each_reunion post, index
      end
        create_row_with_posts_info post
      end
    send_data package.to_stream.read, filename: filename, type: "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
  end


  def make_header_for_each_reunion post, index
    headers = ["Nome", "Descrição", "Status", "Bom/Ruim", "Data"]
    @worksheet.add_row([""]) if @previous_date != nil
    @previous_date = post.date
    @worksheet.merge_cells("A#{index + @extra_lines}:E#{index + @extra_lines}")
    @worksheet.add_row(["Reunião #{post.date}"])
    @worksheet.add_row(headers )
    @extra_lines += 3
  end

  def create_row_with_posts_info post
    row = [
      post.dev.name,       
      post.description,
      post.status,          
      post.good_bad,          
      post.date,             
    ]
    @worksheet.add_row(row)
  end
end

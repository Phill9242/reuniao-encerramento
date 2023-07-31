class ExportController < ApplicationController

  def index
    
  end

  def search
    @posts = Post.joins(:dev).order(:date, 'devs.name', :good_bad)
    @posts = @posts.where("devs.name LIKE ? OR description LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%") if params[:search].present?
    @posts = @posts.where(status: params[:status]) if params[:status] != 'Todos'
    @posts = @posts.where(good_bad: params[:good_bad]) if params[:good_bad] != 'Todos'
    
    if params[:start_date].present? && params[:end_date].present?
      start_date = Date.parse(params[:start_date])
      end_date = Date.parse(params[:end_date])
      @posts = @posts.where(date: start_date..end_date)
    end 
    
    filename = "reunião_encerramento.xlsx"
    package = Axlsx::Package.new
    workbook = package.workbook
    @worksheet = workbook.add_worksheet(name: "Reuniões")
    @previous_date = nil
    @extra_lines = 1
    @posts.each_with_index do |post, index|
      if @previous_date != post.date
        make_header_for_each_reunion post, index
      end
      create_row_with_posts_info post
    end
    respond_to do |format|
      format.html
      format.xlsx {
        send_data(package.to_stream.read, filename: "reunião_encerramento.xlsx", type: 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet')
      }
    end
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

require "csv"

while true do
    puts "1(新規でメモを作成) 2(既存のメモを編集する)のどちらかを選択してください"
    
    memo_type = gets.to_i
    
    if memo_type == 1
        puts "拡張子を除いたファイル名を入力してください"
        csv_name = gets.chomp
        puts "メモした内容を記入してください"
        CSV.open("#{csv_name}.csv", "w") do |csv|
            data = gets.chomp
            csv << ["#{data}"]
        end
        break
    elsif memo_type == 2
        puts "編集したいファイル名を入力してください【※拡張子を除く】"
        file_name = gets.chomp
        puts "書き込みたいメモを記入してください"
        add_text = gets.chomp
        add_data = ["#{add_text}"]
        # csv = CSV.open("#{file_name}.csv", "a")
        #     csv.add_row(add_data)
        #     csv.close
        CSV.open("#{file_name}.csv", "a") do |csv|
                csv << add_data
                csv.close
        end
        break
    else
        puts "【ERROR】1か2のどちらかを入力してください"
    end

end

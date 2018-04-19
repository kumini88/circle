require 'csv'

list = ["01_hokkaido", "02_aomori", "03_iwate", "04_miyagi", "05_akita", 
        "06_yamagata", "07_fukushima", "08_ibaraki", "09_tochigi", "10_gunma", 
        "11_saitama", "12_chiba", "13_tokyo", "14_kanagawa", "15_niigata", 
        "16_toyama", "17_ishikawa", "18_fukui", "19_yamanashi", "20_nagano", 
        "21_gifu", "22_shizuoka", "23_aichi", "24_mie", "25_shiga", 
        "26_kyoto", "27_osaka", "28_hyogo", "29_nara", "30_wakayama", 
        "31_tottori", "32_shimane", "33_okayama", "34_hiroshima", "35_yamaguchi", 
        "36_tokushima", "37_kagawa", "38_ehime", "39_kochi", "40_fukuoka", 
        "41_saga", "42_nagasaki", "43_kumamoto", "44_oita", "45_miyazaki", 
        "46_kagoshima", "47_okinawa", "99_kokugai"] 
count = 0
#for i in list do
    
#  CSV.foreach("db/company_csv/#{i}_all_20171228.csv") do |row|
  CSV.foreach("db/company_csv/13_tokyo_all_20171228.csv") do |row|
    if count <= 9000
      if row[8] == "301"
        @company = Company.create(name: row[6])
        @company.save
        count += 1
      end
    else
      break
    end
  end
#end
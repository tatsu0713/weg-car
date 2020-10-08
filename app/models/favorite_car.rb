class FavoriteCar < ActiveHash::Base
  self.data = [
    { id: 1, name: '選択してください' },
    { id: 2, name: 'フォルクスワーゲン' },
    { id: 3, name: 'アウディ' },
    { id: 4, name: 'メルセデスベンツ' },
    { id: 5, name: 'BMW' }
  ]
end
class TimeTable < ActiveHash::Base
  self.data = [
    { id: 1, name: '1 × 1', answer: 1 },
    { id: 2, name: '1 × 2', answer: 2 },
    { id: 3, name: '1 × 3', answer: 3 },
  ]
end
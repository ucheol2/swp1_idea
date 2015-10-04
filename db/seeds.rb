# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
test_user = User.create(email: 'test@test.com', password: ENV["TESTER_PASSWORD"], password_confirmation: ENV["TESTER_PASSWORD"], name: "테스트")

idea = Idea.create(name: "샘플", password: ENV["TEST_IDEA_PASSWORD"], summary: "벤처창업 웹프로그래밍을 하자!", description: "설명입니다\n글과 사진으로자신의 아이디어를 상세하게 설명하고 팀원을 모아보아요!")
IdeaUser.create(idea: idea, user: test_user, owned: true)
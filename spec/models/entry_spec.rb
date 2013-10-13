require 'spec_helper'

describe Entry do
  it 'persists a name' do
    entry = FactoryGirl.create(:entry, name: 'test')
    expect(entry.reload.name).to eq 'test'
  end

  it 'persists an email' do
    entry = FactoryGirl.create(:entry, email: 'test')
    expect(entry.reload.email).to eq 'test'
  end

  it 'persists a phone' do
    entry = FactoryGirl.create(:entry, phone: 'test')
    expect(entry.reload.phone).to eq 'test'
  end

  it 'persists a description' do
    entry = FactoryGirl.create(:entry, description: 'test')
    expect(entry.reload.description).to eq 'test'
  end

  it 'requires a name' do
    entry = FactoryGirl.build(:entry, name: nil)
    expect(entry.valid?).to be_false
    expect(entry.errors.to_a).to eq ['Name can\'t be blank']
  end

  it 'requires a email' do
    entry = FactoryGirl.build(:entry, email: nil)
    expect(entry.valid?).to be_false
    expect(entry.errors.to_a).to eq ['Email can\'t be blank']
  end

  it 'requires a phone' do
    entry = FactoryGirl.build(:entry, phone: nil)
    expect(entry.valid?).to be_false
    expect(entry.errors.to_a).to eq ['Phone can\'t be blank']
  end

  it 'requires a description' do
    entry = FactoryGirl.build(:entry, description: nil)
    expect(entry.valid?).to be_false
    expect(entry.errors.to_a).to eq ['Description can\'t be blank']
  end

  it 'requires a name' do
    entry = FactoryGirl.build(:entry, name: nil)
    expect(entry.valid?).to be_false
    expect(entry.errors.to_a).to eq ['Name can\'t be blank']
  end

  it 'requires a name' do
    entry = FactoryGirl.build(:entry, name: nil)
    expect(entry.valid?).to be_false
    expect(entry.errors.to_a).to eq ['Name can\'t be blank']
  end

  it 'requires a name' do
    entry = FactoryGirl.build(:entry, name: nil)
    expect(entry.valid?).to be_false
    expect(entry.errors.to_a).to eq ['Name can\'t be blank']
  end

  it 'requires a name' do
    entry = FactoryGirl.build(:entry, name: nil)
    expect(entry.valid?).to be_false
    expect(entry.errors.to_a).to eq ['Name can\'t be blank']
  end
end

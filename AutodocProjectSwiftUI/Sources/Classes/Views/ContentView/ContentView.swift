import SwiftUI

struct ContentView: View {
    
    @FetchRequest(fetchRequest: NewsModelDB.fetch(), animation: .default)
    var items: FetchedResults<NewsModelDB>
    
    let viewModel: ContentViewModel
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(items) { item in
                    VStack(spacing: 12) {
                        
                        Text(item.title)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(Font.system(size: 16, weight: .bold))
                        
                        Text(item.subtitle)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(Font.system(size: 14))
                        
                        HStack(spacing: 8) {
                            
                            Text(DateFormatter.ddMMMMyyyy.string(from: item.publishedDate))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .font(Font.system(size: 12))
                            
                            ZStack {
                                Text(item.categoryType)
                                    .font(Font.system(size: 12))
                                    .foregroundStyle(Color(hex: "FFFFFF"))
                                    .padding(EdgeInsets(top: 2, leading: 8, bottom: 2, trailing: 8))
                            }
                            .frame(height: 16)
                            .background {
                                Color(hex: "EE6B6E")
                                    .cornerRadius(8)
                            }
                        }
                        
                        if let titleImageUrl = item.titleImageUrl {
                            CachedAsyncImage(url: titleImageUrl) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                            } placeholder: {
                                
                            }
                        }
                    }
                    
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                        .tint(.black)
                }
            }
            .navigationTitle("News")
        }
        .onAppear {
            viewModel.start()
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            viewModel.delete(offsets: offsets, items: items)
        }
    }
}

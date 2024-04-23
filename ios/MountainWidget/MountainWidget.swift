//
//  HomeWidgetExample.swift
//  HomeWidgetExample
//
//  Created by Anton Borries on 04.10.20.
//

import SwiftUI
import WidgetKit

private let widgetGroupId = "group.com.ignaciozhang85.mountain"

struct Provider: TimelineProvider {
  func placeholder(in context: Context) -> ExampleEntry {
    ExampleEntry(date: Date(), title: "Placeholder Title", message: "Placeholder Message")
  }

  func getSnapshot(in context: Context, completion: @escaping (ExampleEntry) -> Void) {
    let data = UserDefaults.init(suiteName: widgetGroupId)
    let entry = ExampleEntry(
      date: Date(), title: data?.string(forKey: "title") ?? "No Title Set",
      message: data?.string(forKey: "message") ?? "No Message Set")
    completion(entry)
  }

  func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> Void) {
    getSnapshot(in: context) { (entry) in
      let timeline = Timeline(entries: [entry], policy: .atEnd)
      completion(timeline)
    }
  }
}

struct ExampleEntry: TimelineEntry {
  let date: Date
  let title: String
  let message: String
}

struct MountainWidgetEntryView: View {
  var entry: Provider.Entry
  let data = UserDefaults.init(suiteName: widgetGroupId)
  let iconPath: String?

  init(entry: Provider.Entry) {
    self.entry = entry
    iconPath = data?.string(forKey: "dashIcon")

  }

  var body: some View {
    VStack.init(
      alignment: .center, spacing: /*@START_MENU_TOKEN@*/ nil /*@END_MENU_TOKEN@*/,
      content: {
        Text(entry.title).bold().font( /*@START_MENU_TOKEN@*/.title /*@END_MENU_TOKEN@*/).frame(
            maxWidth: .infinity, alignment: .leading)
        Text(entry.message)
          .font(.body)
          .widgetURL(URL(string: "homeWidgetExample://message?message=\(entry.message)&homeWidget"))
          .frame(maxWidth: .infinity, alignment: .leading)
        if iconPath != nil {
          Image(uiImage: UIImage(contentsOfFile: iconPath!)!).resizable()
            .scaledToFill()
            .frame(width: 64, height: 64)
        }
      }
    )
  }
}


struct MountainWidget: Widget {
  let kind: String = "MountainWidget"

  var body: some WidgetConfiguration {
    StaticConfiguration(kind: kind, provider: Provider()) { entry in
        MountainWidgetEntryView(entry: entry)
    }
    .configurationDisplayName("My Widget")
    .description("This is an example widget.")
  }
}

struct HomeWidgetExample_Previews: PreviewProvider {
  static var previews: some View {
      MountainWidgetEntryView(
      entry: ExampleEntry(date: Date(), title: "Example Title", message: "Example Message")
    )
    .previewContext(WidgetPreviewContext(family: .systemSmall))
  }
}

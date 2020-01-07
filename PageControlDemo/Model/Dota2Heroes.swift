//
//  Dota2Heroes.swift
//  PageControlDemo
//
//  Created by Julio Collado on 1/7/20.
//  Copyright © 2020 Julio Collado. All rights reserved.
//

import UIKit

enum Dota2Heroes: Int, CaseIterable {
    case Axe, Balanar, Dragon, Nevermore
    
    var name: String {
        switch self {
        case .Axe:
            return "Axe"
        case .Balanar:
            return "Night Stalker"
        case .Dragon:
            return "Dragon Knight"
        case .Nevermore:
            return "Nevermore the Shadow Fiend"
        }
    }
    
    var description: String {
        switch self {
        case .Axe:
            return "As a grunt in the Army of Red Mist, Mogul Khan set his sights on the rank of Red Mist General. In battle after battle he proved his worth through gory deed. His rise through the ranks was helped by the fact that he never hesitated to decapitate a superior. Through the seven year Campaign of the Thousand Tarns, he distinguished himself in glorious carnage, his star of fame shining ever brighter, while the number of comrades in arms steadily dwindled."
        case .Balanar:
            return "Of the Night Stalker, there is no history, only stories. There are ancient tales woven into the lore of every race and every culture, of an impossible time before sunlight and daytime, when night reigned alone and the world was covered with the creatures of darkness--creatures like Balanar the Night Stalker."
        case .Dragon:
            return "After years on the trail of a legendary Eldwurm, the Knight Davion found himself facing a disappointing foe: the dreaded Slyrak had grown ancient and frail, its wings tattered, its few remaining scales stricken with scale-rot, its fangs ground to nubs, and its fire-gouts no more threatening than a pack of wet matchsticks. Seeing no honor to be gained in dragon-murder, Knight Davion prepared to turn away and leave his old foe to die in peace."
        case .Nevermore:
            return "It is said that Nevermore the Shadow Fiend has the soul of a poet, and in fact he has thousands of them. Over the ages he has claimed the souls of poets, priests, emperors, beggars, slaves, philosophers, criminals and (naturally) heroes; no sort of soul escapes him. What he does with them is unknown. No one has ever peered into the Abysm whence Nevermore reaches out like an eel from among astral rocks."
        }
    }
    
    var image: UIImage? {
        switch self {
        case .Axe:
            return UIImage(named: "axe")
        case .Balanar:
            return UIImage(named: "balanar")
        case .Dragon:
            return UIImage(named: "dragon")
        case .Nevermore:
            return UIImage(named: "nevermore")
        }
    }
}

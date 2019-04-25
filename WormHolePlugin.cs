using Turbo.Plugins.Default;
using System.Linq;

namespace Turbo.Plugins.deianu
{
    public class WormHolePlugin : BasePlugin, IInGameWorldPainter
    {
        public WorldDecoratorCollection WormHoleDecorator { get; set; }

        public WormHolePlugin()
        {
            Enabled = true;
        }

        public override void Load(IController hud)
        {
            base.Load(hud);
            WormHoleDecorator = new WorldDecoratorCollection(
                new GroundCircleDecorator(Hud)
                {
                    Brush = Hud.Render.CreateBrush(128, 255, 0, 0, 6),
                    Radius = 5f,
                }
            );
        }
                
        public void PaintWorld(WorldLayer layer)
        {
            foreach (var actor in Hud.Game.Actors)
            {
                switch (actor.SnoActor.Sno)
                {
                    case ActorSnoEnum._x1_monsteraffix_teleportmines:
                        WormHoleDecorator.Paint(layer, actor, actor.FloorCoordinate, null);
                        break;
                }
            }
        }
    }
}
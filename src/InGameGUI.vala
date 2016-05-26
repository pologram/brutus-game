using Gtk;

public class InGameGUI : Grid
{
	private unowned MainWindow container;
	private RadioButton grassButton;
	private RadioButton forestButton;
	private RadioButton farmableButton;
	private RadioButton rockButton;
	private RadioButton waterButton;
	private RadioButton fishButton;
	private RadioButton tileButton;
	private RadioButton buildingButton;
	private RadioButton roadButton;
	private RadioButton houseButton;
	private RadioButton fountainButton;
	private RadioButton marketButton;
	private RadioButton farmButton;

	public void onEditModeToggled()
	{
		grassButton.get_group().foreach ((item) => {
			item.set_sensitive(tileButton.get_active());
		});

		roadButton.get_group().foreach ((item) => {
			item.set_sensitive(buildingButton.get_active());
		});

		container.editMode = tileButton.get_active() ? 0 : 1;
	}

	public InGameGUI(MainWindow containerInput)
	{
		container = containerInput;
		grassButton = new Gtk.RadioButton.with_label(null, "Grass");
		forestButton = new Gtk.RadioButton.with_label_from_widget(grassButton, "Forest");
		farmableButton = new Gtk.RadioButton.with_label_from_widget(grassButton, "Farmable");
		rockButton = new Gtk.RadioButton.with_label_from_widget(grassButton, "Rock");
		waterButton = new Gtk.RadioButton.with_label_from_widget(grassButton, "Water");
		fishButton = new Gtk.RadioButton.with_label_from_widget(grassButton, "Fish");
		tileButton = new Gtk.RadioButton.with_label(null, "Tile");
		buildingButton = new Gtk.RadioButton.with_label_from_widget(tileButton, "Building");
		roadButton = new Gtk.RadioButton.with_label(null, "Road");
		houseButton = new Gtk.RadioButton.with_label_from_widget(roadButton, "House");
		fountainButton = new Gtk.RadioButton.with_label_from_widget(roadButton, "Fountain");
		marketButton = new Gtk.RadioButton.with_label_from_widget(roadButton, "Market");
		farmButton = new Gtk.RadioButton.with_label_from_widget(roadButton, "Farm");

		tileButton.toggled.connect(() =>
			onEditModeToggled()
		);

		grassButton.clicked.connect (() => {
			container.tileBrush = Tile.Terrain.GRASS;
		});

		forestButton.clicked.connect (() => {
			container.tileBrush = Tile.Terrain.FOREST;
		});

		farmableButton.clicked.connect (() => {
			container.tileBrush = Tile.Terrain.FARMABLE;
		});

		rockButton.clicked.connect (() => {
			container.tileBrush = Tile.Terrain.ROCK;
		});

		waterButton.clicked.connect (() => {
			container.tileBrush = Tile.Terrain.WATER;
		});

		fishButton.clicked.connect (() => {
			container.tileBrush = Tile.Terrain.FISH;
		});

		roadButton.clicked.connect (() => {
			container.buildingBrush = Building.Type.ROAD;
		});

		houseButton.clicked.connect (() => {
			container.buildingBrush = Building.Type.HOUSE;
		});

		fountainButton.clicked.connect (() => {
			container.buildingBrush = Building.Type.FOUNTAIN;
		});

		marketButton.clicked.connect (() => {
			container.buildingBrush = Building.Type.MARKET;
		});

		farmButton.clicked.connect (() => {
			container.buildingBrush = Building.Type.FARM;
		});



		grassButton.set_mode(false);
		forestButton.set_mode(false);
		farmableButton.set_mode(false);
		rockButton.set_mode(false);
		waterButton.set_mode(false);
		fishButton.set_mode(false);
		tileButton.set_mode(false);
		buildingButton.set_mode(false);
		roadButton.set_mode(false);
		houseButton.set_mode(false);
		fountainButton.set_mode(false);
		marketButton.set_mode(false);
		farmButton.set_mode(false);

		attach(grassButton, 0, 0, 1, 1);
		attach(forestButton, 1, 0, 1, 1);
		attach(farmableButton, 0, 1, 1, 1);
		attach(rockButton, 1, 1, 1, 1);
		attach(waterButton, 0, 2, 1, 1);
		attach(fishButton, 1, 2, 1, 1);
		attach(tileButton, 0, 3, 1, 1);
		attach(buildingButton, 1, 3, 1, 1);
		attach(roadButton, 0, 4, 1, 1);
		attach(houseButton, 1, 4, 1, 1);
		attach(fountainButton, 0, 5, 1, 1);
		attach(marketButton, 1, 5, 1, 1);
		attach(farmButton, 0, 6, 1, 1);

		halign = Gtk.Align.END;

		tileButton.set_margin_top(6);
		buildingButton.set_margin_top(6);

		tileButton.set_margin_bottom(6);
		buildingButton.set_margin_bottom(6);

		buildingButton.set_active(true);
	}
}
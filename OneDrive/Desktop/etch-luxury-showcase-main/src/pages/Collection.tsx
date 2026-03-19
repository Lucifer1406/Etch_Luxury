import { useState } from "react";
import { Link } from "react-router-dom";
import { useScrollFadeIn } from "@/hooks/useScrollFadeIn";
import Layout from "@/components/Layout";
import productBlackSilver from "@/assets/product-black-silver.jpg";
import productOceanBlue from "@/assets/product-ocean-blue.jpg";
import productMonochrome from "@/assets/product-monochrome.jpg";
import productRiverTable from "@/assets/product-river-table.jpg";
import productCoasters from "@/assets/product-coasters.jpg";
import productNamePlaque from "@/assets/product-name-plaque.jpg";

type Category = "All" | "Trays" | "Boards" | "Tables" | "Gifting";

const products = [
  { name: "Black & Silver Serving Tray", price: "₹4,500", image: productBlackSilver, cat: "Trays" as Category },
  { name: "Ocean Blue Tray", price: "₹5,200", image: productOceanBlue, cat: "Trays" as Category },
  { name: "Monochrome Cheese Board", price: "₹3,800", image: productMonochrome, cat: "Boards" as Category },
  { name: "Resin River Table", price: "₹28,000", image: productRiverTable, cat: "Tables" as Category },
  { name: "Coaster Set", price: "₹1,800", image: productCoasters, cat: "Gifting" as Category },
  { name: "Custom Name Plaque", price: "₹2,500", image: productNamePlaque, cat: "Gifting" as Category },
];

const categories: Category[] = ["All", "Trays", "Boards", "Tables", "Gifting"];

export default function Collection() {
  const [active, setActive] = useState<Category>("All");
  const containerRef = useScrollFadeIn();
  const filtered = active === "All" ? products : products.filter((p) => p.cat === active);

  return (
    <Layout>
      <div ref={containerRef}>
        <section className="pt-32 pb-16 px-6 max-w-7xl mx-auto">
          <h1 className="font-heading text-4xl md:text-5xl text-center font-light tracking-wide mb-4">
            The Collection
          </h1>
          <p className="text-center text-muted-foreground text-sm tracking-widest uppercase mb-12">
            Each piece, a conversation starter
          </p>

          {/* Filter tabs */}
          <div className="flex justify-center gap-4 md:gap-8 mb-16 flex-wrap">
            {categories.map((cat) => (
              <button
                key={cat}
                onClick={() => setActive(cat)}
                className={`text-xs tracking-[0.2em] uppercase font-body pb-1 border-b transition-all duration-300 ${
                  active === cat
                    ? "text-primary border-primary"
                    : "text-muted-foreground border-transparent hover:text-foreground"
                }`}
              >
                {cat}
              </button>
            ))}
          </div>

          {/* Grid */}
          <div className="fade-in-section grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8 md:gap-10">
            {filtered.map((p) => (
              <div key={p.name} className="group">
                <div className="relative overflow-hidden aspect-square bg-secondary">
                  <img
                    src={p.image}
                    alt={p.name}
                    className="w-full h-full object-cover transition-transform duration-700 group-hover:scale-105"
                  />
                  <div className="absolute inset-0 bg-foreground/0 group-hover:bg-foreground/40 transition-all duration-500 flex items-center justify-center">
                    <Link
                      to={`/product/${p.name.replace(/\s+/g, '-').toLowerCase()}`}
                      className="opacity-0 group-hover:opacity-100 transition-opacity duration-500 px-6 py-2 border border-cream text-cream text-xs tracking-[0.2em] uppercase hover:bg-cream hover:text-foreground"
                    >
                      Enquire Now
                    </Link>
                  </div>
                </div>
                <div className="mt-4">
                  <h3 className="font-heading text-lg tracking-wide">{p.name}</h3>
                  <p className="text-muted-foreground text-sm mt-1">Starting {p.price}</p>
                </div>
              </div>
            ))}
          </div>
        </section>
      </div>
    </Layout>
  );
}

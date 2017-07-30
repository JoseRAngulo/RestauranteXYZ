﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using capaEntidades;
using capaNegocio;


namespace RestauranteXYZ.Formularios
{
    public partial class Orden : Form
    {

        CheckBox[] chkArray;
        NumericUpDown[] nudArray;
        List<CEDetalleFactura> detallesFactura = new List<CEDetalleFactura>();
        
        
       

        public Orden()
        {
            InitializeComponent();
            chkArray = new CheckBox[] {chkSopaGallina, chkPapas, chkSopaTortilla, chkPollo, chkCarne, chkLomo, chkHamburguesa, chkTocino, chkPupusas, chkGaseosas,
                                       chkBatido, chkAgua, chkCafe, chkTe, chkBrownie, chkTorta};
            nudArray = new NumericUpDown[] {nudSopaGallina, nudPapas, nudSopaTortilla, nudPollo, nudCarne, nudLomo, nudHamburguesa, nudTocino, nudPupusas, nudGaseosas,
                                            nudBatido, nudAgua, nudCafe, nudTe, nudBrownie, nudTorta};
        }

        private void lblVolver_Click(object sender, EventArgs e)
        {
            this.Hide();
        }


        private void chkSopaGallina_CheckedChanged(object sender, EventArgs e)
        {
            validarNuds();
        }

        private void chkPapas_CheckedChanged(object sender, EventArgs e)
        {
            validarNuds();
        }

        private void chkSopaTortilla_CheckedChanged(object sender, EventArgs e)
        {
            validarNuds();
        }

        private void chkPollo_CheckedChanged(object sender, EventArgs e)
        {
            validarNuds();
        }

        private void chkCarne_CheckedChanged(object sender, EventArgs e)
        {
            validarNuds();
        }

        private void chkLomo_CheckedChanged(object sender, EventArgs e)
        {
            validarNuds();
        }

        private void chkHamburguesa_CheckedChanged(object sender, EventArgs e)
        {
            validarNuds();
        }

        private void chkTocino_CheckedChanged(object sender, EventArgs e)
        {
            validarNuds();
        }

        private void chkPupusas_CheckedChanged(object sender, EventArgs e)
        {
            validarNuds();
        }

        private void chkGaseosas_CheckedChanged(object sender, EventArgs e)
        {
            validarNuds();
        }

        private void chkBatido_CheckedChanged(object sender, EventArgs e)
        {
            validarNuds();
        }

        private void chkAgua_CheckedChanged(object sender, EventArgs e)
        {
            validarNuds();
        }

        private void chkCafe_CheckedChanged(object sender, EventArgs e)
        {
            validarNuds();
        }

        private void chkTe_CheckedChanged(object sender, EventArgs e)
        {
            validarNuds();
        }

        private void chkBrownie_CheckedChanged(object sender, EventArgs e)
        {
            validarNuds();
        }

        private void chkTorta_CheckedChanged(object sender, EventArgs e)
        {
            validarNuds();
        }

        private void validarNuds()
        {
            for (int i = 0; i < 16; i++)
            {
                if (chkArray[i].Checked)
                {
                    nudArray[i].Enabled = true;
                }
                else
                {
                    nudArray[i].Enabled = false;
                }
            }
        }
        private void agregarDgv()
        {
            
            for(int i = 0; i < 16; i++)
            {
                if (chkArray[i].Checked)
                    
                {
                    CEDetalleFactura det = new CEDetalleFactura();
                    CEProducto prod = new CEProducto();
                    CNProducto get = new CNProducto();
                    //asignar id a objeto producto, recuperar valores de la BD
                    prod.IdProducto = i + 1;
                    prod.Nombre = get.NombreProducto(prod.IdProducto);
                    prod.Precio = get.PrecioProducto(prod.IdProducto);
                    //Agregar fila a detalle factura
                    det.IdProducto = prod.IdProducto;
                    det.Cantidad = int.Parse(nudArray[i].Value.ToString());


                    DataGridViewRow row = (DataGridViewRow)dgvDetalleFactura.Rows[0].Clone(); 
                    row.Cells[0].Value = prod.Nombre;
                    row.Cells[1].Value = nudArray[i].Value;
                    row.Cells[2].Value = prod.Precio;
                    row.Cells[3].Value = prod.Precio * nudArray[i].Value;
                    dgvDetalleFactura.Rows.Add(row);
                    detallesFactura.Add(det);
                }
            }
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            agregarDgv();
        }

        private void btnFactura_Click(object sender, EventArgs e)
        {
            int i;
            CNDetalleFactura cnDetFactura = new CNDetalleFactura();
            CNFactura cnFactura = new CNFactura();
            CEFactura factura = new CEFactura();
            
            factura.IdEmpleado = int.Parse(lblUsuario.Text); //test
            factura.Fecha = DateTime.Now;
            
            cnFactura.InsertarFactura(factura);
            i = cnFactura.MaxFactura();
            factura.IdFactura = i;
            foreach (CEDetalleFactura det in detallesFactura)
            {
                det.IdFactura = i;
                cnDetFactura.InsertarDFactura(det);
            }
            Factura frmFactura = new Factura(factura);

            if (frmFactura.ShowDialog() == DialogResult.OK)
            {
                this.Dispose();
            }
            else
            {
                limpiar();
            }
            
        }
        private void limpiar()
        {
            for (int i = 0; i < 16; i++)
            {
                chkArray[i].Checked = false;
                nudArray[i].Value = 1;
                dgvDetalleFactura.Rows.Clear();
            }
            detallesFactura.Clear();
            validarNuds();

        }
    }
}
